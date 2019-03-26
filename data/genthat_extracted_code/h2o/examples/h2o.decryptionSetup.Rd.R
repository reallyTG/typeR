library(h2o)


### Name: h2o.decryptionSetup
### Title: Setup a Decryption Tool
### Aliases: h2o.decryptionSetup

### ** Examples

## Not run: 
##D library(h2o)
##D h2o.init()
##D ks_path <- system.file("extdata", "keystore.jks", package = "h2o")
##D keystore <- h2o.importFile(path = ks_path, parse = FALSE) # don't parse, keep as a binary file
##D cipher <- "AES/ECB/PKCS5Padding"
##D pwd <- "Password123"
##D alias <- "secretKeyAlias"
##D dt <- h2o.decryptionSetup(keystore, key_alias = alias, password = pwd, cipher_spec = cipher)
##D data_path <- system.file("extdata", "prostate.csv.aes", package = "h2o")
##D data <- h2o.importFile(data_path, decrypt_tool = dt)
##D summary(data)
## End(Not run)



