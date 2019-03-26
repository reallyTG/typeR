library(urlshorteneR)


### Name: bitly_LinksInfo
### Title: Used to return the page title for a given Bitlink.
### Aliases: bitly_LinksInfo

### ** Examples

## Not run: 
##D  
##D bitly_token <- bitly_auth(key = "be03aead58f23bc1aee6e1d7b7a1d99d62f0ede8", 
##D secret = "b7e4abaf8b26ec4daa92b1e64502736f5cd78899")
##D bitly_LinksInfo(shortUrl = "http://bit.ly/DPetrov")
##D bitly_LinksInfo(hash = "DPetrov", showRequestURL = TRUE) 
##D bitly_LinksInfo(hash = "DPetrov", expand_user = "true")
##D 
##D ## hash is the one which is only returned. Dont use
##D bitly_LinksInfo(shortUrl = "on.natgeo.com/1bEVhwE", hash = "DPetrov") 
##D 
##D ## manyHashes <- list("DPetrov", "1QU8CFm", "1R1LPSE", "1LNqqva")
##D ## for (u in 1:length(manyHashes)) {
##D ##   print(bitly_LinksInfo(hashIN = manyHashes[[u]], showRequestURL = TRUE))
##D ## }
## End(Not run)




