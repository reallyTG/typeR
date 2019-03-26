library(dataone)


### Name: d1SolrQuery
### Title: A method to query the DataONE solr endpoint of the Coordinating
###   Node.
### Aliases: d1SolrQuery d1SolrQuery,D1Client,list-method
###   d1SolrQuery,D1Client,character-method

### ** Examples

## Not run: 
##D  
##D library(dataone)
##D d1c <- D1Client("PROD", "urn:node:KNB")
##D queryParams <- list(q="id:doi*", rows="5", 
##D     fq="(abstract:chlorophyll AND dateUploaded:[2000-01-01T00:00:00Z TO NOW])", 
##D     fl="title,id,abstract,size,dateUploaded,attributeName")
##D result <- d1SolrQuery(d1c, queryParams)
## End(Not run)



