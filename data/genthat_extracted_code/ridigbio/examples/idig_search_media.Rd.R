library(ridigbio)


### Name: idig_search_media
### Title: Searching of iDigBio media records
### Aliases: idig_search_media

### ** Examples

## Not run: 
##D # Searching for media using a query on related specimen information - first 
##D # 10 media records with image URIs related to a specimen in the genus Acer:
##D df <- idig_search_media(rq=list(genus="acer"), 
##D                         mq=list("data.ac:accessURI"=list("type"="exists")), 
##D                         fields=c("uuid","data.ac:accessURI"), limit=10)
## End(Not run)



