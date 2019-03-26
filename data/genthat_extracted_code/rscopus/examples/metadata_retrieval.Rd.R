library(rscopus)


### Name: metadata_retrieval
### Title: SCOPUS Citation Retrieval
### Aliases: metadata_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = metadata_retrieval(query = "heart attack",
   verbose = FALSE)
}



