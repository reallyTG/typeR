library(sodium)


### Name: Diffie-Hellman
### Title: Diffie-Hellman
### Aliases: Diffie-Hellman diffie_hellman diffie

### ** Examples

# Bob generates keypair
bob_key <- keygen()
bob_pubkey <- pubkey(bob_key)

# Alice generates keypair
alice_key <- keygen()
alice_pubkey <- pubkey(alice_key)

# After Bob and Alice exchange pubkey they can both derive the secret
alice_secret <- diffie_hellman(alice_key, bob_pubkey)
bob_secret <- diffie_hellman(bob_key, alice_pubkey)
stopifnot(identical(alice_secret, bob_secret))



