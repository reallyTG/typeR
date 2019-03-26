library(text2vec)


### Name: create_tcm
### Title: Term-co-occurence matrix construction
### Aliases: create_tcm create_tcm.itoken create_tcm.itoken_parallel

### ** Examples

## Not run: 
##D data("movie_review")
##D 
##D # single thread
##D 
##D tokens = word_tokenizer(tolower(movie_review$review))
##D it = itoken(tokens)
##D v = create_vocabulary(jobs)
##D vectorizer = vocab_vectorizer(v)
##D tcm = create_tcm(itoken(tokens), vectorizer, skip_grams_window = 3L)
##D 
##D # parallel version
##D 
##D # set to number of cores on your machine
##D N_WORKERS = 1
##D if(require(doParallel)) registerDoParallel(N_WORKERS)
##D splits = split_into(movie_review$review, N_WORKERS)
##D jobs = lapply(splits, itoken, tolower, word_tokenizer)
##D v = create_vocabulary(jobs)
##D vectorizer = vocab_vectorizer(v)
##D jobs = lapply(splits, itoken, tolower, word_tokenizer)
##D 
##D tcm = create_tcm(jobs, vectorizer, skip_grams_window = 3L, skip_grams_window_context = "symmetric")
## End(Not run)



