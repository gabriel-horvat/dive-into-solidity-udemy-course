//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() external {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    
    // function transferAll(address payable to, uint amount) public returns(bool) {
    // require(msg.sender == owner, "only owner can call this");
    //     (bool res,) = to.call{value: getBalance()} ("");
    //     require(res, "your transaction failed");
    // }

    function transferAll(address account) external {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool result, ) = account.call{value: getBalance()}("");
        require(result, "tx failed");
    }

       function start() external {
        players.push(msg.sender);
    }

    function concatenate(string calldata string1, string calldata string2) public pure returns (string memory) {
    // using the cheapest option - calldata here since it's read only
    return string.concat(string1, string2);
    }

    //     function concatenate(string calldata string1, string calldata string2)
    //     external
    //     pure
    //     returns (string memory)
    // {
    //     return string(abi.encodePacked(string1, string2));
    // }

    receive () external payable {
}

fallback () external payable {
}
}
