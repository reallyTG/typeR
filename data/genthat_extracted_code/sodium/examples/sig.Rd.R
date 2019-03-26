library(sodium)


### Name: Signatures
### Title: Create and Verify Signatures
### Aliases: Signatures sig_sign sig sig_verify sig_keygen sig_pubkey

### ** Examples

# Generate keypair
key <- sig_keygen()
pubkey <- sig_pubkey(key)

# Create signature
msg <- serialize(iris, NULL)
sig <- sig_sign(msg, key)
sig_verify(msg, sig, pubkey)



