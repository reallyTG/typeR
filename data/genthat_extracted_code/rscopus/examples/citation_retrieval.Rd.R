library(rscopus)


### Name: citation_retrieval
### Title: SCOPUS Citation Retrieval
### Aliases: citation_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = citation_retrieval(pii = "S1053811915002700",
   verbose = FALSE)
}



