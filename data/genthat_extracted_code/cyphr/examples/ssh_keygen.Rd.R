library(cyphr)


### Name: ssh_keygen
### Title: Create ssh keypairs
### Aliases: ssh_keygen

### ** Examples

# Generate a new key in a temporary directory:
path <- cyphr::ssh_keygen(password = FALSE)
dir(path) # will contain id_rsa and id_rsa.pub

# This key can now be used via keypair_openssl:
key <- cyphr::keypair_openssl(path, path)
secret <- cyphr::encrypt_string("hello", key)
cyphr::decrypt_string(secret, key)

# Cleanup
unlink(path, recursive = TRUE)



