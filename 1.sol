pragma solidity ^0.8.0;

contract DigitalIdentity {
  struct Identity {
    address owner;
    mapping(bytes32 => bytes32) attributes;
  }

  mapping(address => Identity) identities;

  // Add an attribute to the calling user's identity
  function addAttribute(bytes32 key, bytes32 value) public {
    require(identities[msg.sender].owner == msg.sender, "No identity found");
    identities[msg.sender].attributes[key] = value;
  }

  // Get the value of an attribute for a specific user
  function getAttribute(address user, bytes32 key) public view returns (bytes32) {
    require(identities[user].owner != address(0), "No identity found");
    return identities[user].attributes[key];
  }

  // Register a new user identity
  function registerIdentity() public {
    require(identities[msg.sender].owner == address(0), "Identity already registered");
    identities[msg.sender].owner = msg.sender;
  }

}
