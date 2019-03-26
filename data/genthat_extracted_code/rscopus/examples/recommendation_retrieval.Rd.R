library(rscopus)


### Name: recommendation_retrieval
### Title: ScienceDirect Article Recommendation Retrieval
### Aliases: recommendation_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = recommendation_retrieval("S1053811915002700", identifier = "pii",
   verbose = FALSE)
}



