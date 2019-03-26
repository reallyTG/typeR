library(urlshorteneR)


### Name: bitly_LinksLookup
### Title: Query for a Bitlink based on a long URL.
### Aliases: bitly_LinksLookup

### ** Examples

## Not run: 
##D  
##D bitly_token <- bitly_auth(key = "be03aead58f23bc1aee6e1d7b7a1d99d62f0ede8", 
##D secret = "b7e4abaf8b26ec4daa92b1e64502736f5cd78899")
##D bitly_LinksLookup(url = "http://www.seznam.cz/")
##D bitly_LinksLookup(url = "http://www.seznam.cz/", showRequestURL = TRUE) 
##D 
##D manyUrls <- list("http://www.seznam.cz/", "http://www.seznamasdas.cz/", 
##D "http://www.seznam.cz/asadasd", "http://www.seznam.cz/adqwrewtregt")
##D for (u in 1:length(manyUrls)) {
##D    print(bitly_LinksLookup(url = manyUrls[[u]], showRequestURL = TRUE))
##D }
## End(Not run)




