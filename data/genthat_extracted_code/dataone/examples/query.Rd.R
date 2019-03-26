library(dataone)


### Name: query
### Title: Search DataONE for data and metadata objects
### Aliases: query query,D1Node-method

### ** Examples

## Not run: 
##D library(dataone)
##D cn <- CNode("PROD")
##D queryParams <- list(q="id:doi*", rows="5", 
##D     fq="(abstract:chlorophyll AND dateUploaded:[2000-01-01T00:00:00Z TO NOW])", 
##D     fl="title,id,abstract,size,dateUploaded,attributeName")
##D # Return result as a list.
##D result <- query(cn, queryParams, as="list")
##D 
##D # Query and return the result as a data.frame of character values.
##D queryParams <- list(q="id:doi*", rows="3", 
##D     fq="(abstract:chlorophyll AND dateUploaded:[2000-01-01T00:00:00Z TO NOW])", 
##D     fl="title,id,abstract,size,dateUploaded,attributeName")
##D result <- query(cn, queryParams, as="data.frame", parse=FALSE)
##D 
##D # Return the result as JSON
##D queryParams <- "q=id:doi*&rows=2&wt=json"
##D result <- query(cn, queryParams, as="json")
##D 
##D # The following query shows how to embed quotes
##D cn <- CNode("SANDBOX2")
##D queryParamList <- list(q="(attribute:lake) and (attribute:\"Percent Nitrogen\")", rows="1000",
##D                        fl="title,id,abstract,size,dateUploaded,attributeName", wt="xml")
##D result <- query(cn, queryParamList, as="data.frame")
##D 
##D # The following query uses the searchTerms parameter
##D cn <- CNode()
##D mn <- getMNode(cn, "urn:node:KNB")
##D mySearchTerms <- list(abstract="kelp", attribute="biomass")
##D result <- query(mn, searchTerms=mySearchTerms, as="data.frame")
## End(Not run)



