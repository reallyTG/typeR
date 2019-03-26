library(text2vec)


### Name: create_dtm
### Title: Document-term matrix construction
### Aliases: create_dtm create_dtm.itoken create_dtm.list
###   create_dtm.itoken_parallel

### ** Examples

## Not run: 
##D data("movie_review")
##D N = 1000
##D it = itoken(movie_review$review[1:N], preprocess_function = tolower,
##D              tokenizer = word_tokenizer)
##D v = create_vocabulary(it)
##D #remove very common and uncommon words
##D pruned_vocab = prune_vocabulary(v, term_count_min = 10,
##D  doc_proportion_max = 0.5, doc_proportion_min = 0.001)
##D vectorizer = vocab_vectorizer(v)
##D it = itoken(movie_review$review[1:N], preprocess_function = tolower,
##D              tokenizer = word_tokenizer)
##D dtm = create_dtm(it, vectorizer)
##D # get tf-idf matrix from bag-of-words matrix
##D dtm_tfidf = transformer_tfidf(dtm)
##D 
##D ## Example of parallel mode
##D # set to number of cores on your machine
##D N_WORKERS = 1
##D if(require(doParallel)) registerDoParallel(N_WORKERS)
##D splits = split_into(movie_review$review, N_WORKERS)
##D jobs = lapply(splits, itoken, tolower, word_tokenizer, n_chunks = 1)
##D vectorizer = hash_vectorizer()
##D dtm = create_dtm(jobs, vectorizer, type = 'dgTMatrix')
## End(Not run)



