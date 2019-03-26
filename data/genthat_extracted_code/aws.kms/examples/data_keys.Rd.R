library(aws.kms)


### Name: generate_data_key
### Title: Generate data keys
### Aliases: generate_data_key

### ** Examples

## Not run: 
##D   # create a (CMK) key
##D   k <- create_kms_key()
##D   
##D   # generate a data key for local encryption
##D   datakey <- generate_data_key(key = k)
##D   
##D   ## encrypt something locally using datakey$Plaintext
##D   ## then delete the plaintext key
##D   datakey$Plaintext <- NULL
##D   
##D   # decrypt the encrypted data key
##D   datakey$Plaintext <- decrypt(datakey$CiphertextBlob, k, encode = FALSE)
##D   ## then use this to decrypt locally
##D   
##D   # cleanup
##D   delete_kms_key(k)
## End(Not run)



