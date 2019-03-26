library(rscopus)


### Name: article_retrieval
### Title: ScienceDirect Article Retrieval
### Aliases: article_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
    x = article_retrieval("S1053811915002700", identifier = "pii",
    verbose = FALSE, view = "FULL")
    gen = x$content$`full-text-retrieval-response`
    ot = gen$originalText
} else {
 x = article_retrieval("S1053811915002700",
   identifier = "pii",
   api_key_error = FALSE)
}



