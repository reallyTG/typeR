library(rscopus)


### Name: entitlement_retrieval
### Title: ScienceDirect Text Entitlement Retrieval
### Aliases: entitlement_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = entitlement_retrieval("S1053811915002700", identifier = "pii",
   verbose = FALSE)
}



