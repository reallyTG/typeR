library(rscopus)


### Name: abstract_retrieval
### Title: SCOPUS Abstract Retrieval
### Aliases: abstract_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = abstract_retrieval("S1053811915002700", identifier = "pii",
   verbose = FALSE)
}



