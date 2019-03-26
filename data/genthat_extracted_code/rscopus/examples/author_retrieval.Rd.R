library(rscopus)


### Name: author_retrieval_id
### Title: SCOPUS Author Retrieval
### Aliases: author_retrieval_id multi_author_retrieval author_retrieval

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = author_retrieval(au_id = "40462056100",
   verbose = FALSE)
   x = author_retrieval_id("40462056100", identifier = "author_id",
   verbose = FALSE)
} else {
 x = author_retrieval_id(
 "40462056100",
 identifier = "author_id",
   api_key_error = FALSE, verbose = FALSE)
 x = author_retrieval(
 au_id = "40462056100",
   api_key_error = FALSE, verbose = FALSE)
}



