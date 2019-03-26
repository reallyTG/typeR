library(urlshorteneR)


### Name: bitly_LinksExpand
### Title: Given a bitly URL or hash (or multiple), returns the target
###   (long) URL.
### Aliases: bitly_LinksExpand

### ** Examples

## Not run: 
##D  
##D bitly_token <- bitly_auth(key = "be03aead58f23bc1aee6e1d7b7a1d99d62f0ede8", 
##D secret = "b7e4abaf8b26ec4daa92b1e64502736f5cd78899")
##D bitly_LinksExpand(shortUrl = "http://bit.ly/DPetrov")
##D bitly_LinksExpand(hash = "DPetrov", showRequestURL = TRUE) 
##D bitly_LinksExpand(hash = "DPetrov")
##D bitly_LinksExpand(shortUrl = "on.natgeo.com/1bEVhwE", hash = "1bEVhwE")
##D 
##D ## manyHashes <- list("DPetrov", "1QU8CFm", "1R1LPSE", "1LNqqva")
##D ## for (u in 1:length(manyHashes)) {
##D ##   print(bitly_LinksExpand(hashIN = manyHashes[[u]], showRequestURL = TRUE))
##D ## }
## End(Not run)




