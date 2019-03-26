library(openssl)


### Name: ec_dh
### Title: Diffie-Hellman Key Agreement
### Aliases: ec_dh

### ** Examples

## Not run: 
##D # Need two EC keypairs from the same curve
##D alice_key <- ec_keygen("P-521")
##D bob_key <- ec_keygen("P-521")
##D 
##D # Derive public keys
##D alice_pub <- as.list(alice_key)$pubkey
##D bob_pub <- as.list(bob_key)$pubkey
##D 
##D # Both peers can derive the (same) shared secret via each other's pubkey
##D ec_dh(alice_key, bob_pub)
##D ec_dh(bob_key, alice_pub)
## End(Not run)



