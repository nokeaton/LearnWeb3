//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    
    //max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //mapping of whitelisted addresses
    mapping(address => bool) public whitelistedAddresses;

    //to keep track of number of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    //Setting max number of whitelisted addresses -- input by deployer/user at time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    addAddressToWhitelist - function that adds address of the sender to the whitelist
     */
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}