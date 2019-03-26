library(aws.kms)


### Name: encrypt
### Title: Perform encryption/decryption
### Aliases: encrypt decrypt reencrypt

### ** Examples

## Not run: 
##D   # create a key
##D   k <- create_kms_key()
##D   
##D   # encrypt
##D   tmp <- tempfile()
##D   cat("example test", file = tmp)
##D   (etext <- encrypt(tmp, k))
##D   
##D   # decrypt
##D   (dtext <- decrypt(etext, k, encode = FALSE))
##D   if (require("base64enc")) {
##D     rawToChar(base64enc::base64decode(dtext))
##D   }
##D   
##D   # cleanup
##D   delete_kms_key(k)
## End(Not run)



