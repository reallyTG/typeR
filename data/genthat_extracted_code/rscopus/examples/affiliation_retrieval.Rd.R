library(rscopus)


### Name: affiliation_retrieval
### Title: SCOPUS Affiliation Retrieval
### Aliases: affiliation_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = affiliation_retrieval("60006183", identifier = "affiliation_id",
   verbose = FALSE)
}



