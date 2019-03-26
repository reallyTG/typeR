library(rscopus)


### Name: embase_retrieval
### Title: SCOPUS Embase Retrieval
### Aliases: embase_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = embase_retrieval("S1053811915002700", identifier = "pii",
   verbose = FALSE)
}



