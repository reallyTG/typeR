library(openssl)


### Name: read_key
### Title: Parsing keys and certificates
### Aliases: read_key read_pubkey read_cert read_cert_bundle read_pem

### ** Examples

## Not run: 
##D # Read private key
##D key <- read_key("~/.ssh/id_rsa")
##D str(key)
##D 
##D # Read public key
##D pubkey <- read_pubkey("~/.ssh/id_rsa.pub")
##D str(pubkey)
##D 
##D # Read certificates
##D txt <- readLines("https://curl.haxx.se/ca/cacert.pem")
##D bundle <- read_cert_bundle(txt)
##D print(bundle)
## End(Not run)



