library(text2vec)


### Name: itoken
### Title: Iterators (and parallel iterators) over input objects
### Aliases: itoken itoken.list itoken.character itoken.iterator
###   itoken_parallel itoken_parallel.character
###   itoken_parallel.ifiles_parallel itoken_parallel.list

### ** Examples

data("movie_review")
txt = movie_review$review[1:100]
ids = movie_review$id[1:100]
it = itoken(txt, tolower, word_tokenizer, n_chunks = 10)
it = itoken(txt, tolower, word_tokenizer, n_chunks = 10, ids = ids)
# Example of stemming tokenizer
# stem_tokenizer =function(x) {
#   lapply(word_tokenizer(x), SnowballC::wordStem, language="en")
# }
#------------------------------------------------
# PARALLEL iterators
#------------------------------------------------
library(text2vec)

N_WORKERS = 1 # change 1 to number of cores in parallel backend
if(require(doParallel)) registerDoParallel(N_WORKERS)
data("movie_review")
it = itoken_parallel(movie_review$review[1:100], n_chunks = N_WORKERS)
system.time(dtm <- create_dtm(it, hash_vectorizer(2**16), type = 'dgTMatrix'))



