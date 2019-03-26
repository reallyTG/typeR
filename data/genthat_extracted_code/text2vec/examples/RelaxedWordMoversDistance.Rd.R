library(text2vec)


### Name: RelaxedWordMoversDistance
### Title: Creates model which can be used for calculation of "relaxed word
###   movers distance".
### Aliases: RelaxedWordMoversDistance RWMD
### Keywords: datasets

### ** Examples

## Not run: 
##D data("movie_review")
##D tokens = word_tokenizer(tolower(movie_review$review))
##D v = create_vocabulary(itoken(tokens))
##D v = prune_vocabulary(v, term_count_min = 5, doc_proportion_max = 0.5)
##D it = itoken(tokens)
##D vectorizer = vocab_vectorizer(v)
##D dtm = create_dtm(it, vectorizer)
##D tcm = create_tcm(it, vectorizer, skip_grams_window = 5)
##D glove_model = GloVe$new(word_vectors_size = 50, vocabulary = v, x_max = 10)
##D wv = glove_model$fit_transform(tcm, n_iter = 10)
##D # get average of main and context vectors as proposed in GloVe paper
##D wv = wv + t(glove_model$components)
##D rwmd_model = RWMD$new(wv)
##D rwmd_dist = dist2(dtm[1:100, ], dtm[1:10, ], method = rwmd_model, norm = 'none')
##D head(rwmd_dist)
## End(Not run)



