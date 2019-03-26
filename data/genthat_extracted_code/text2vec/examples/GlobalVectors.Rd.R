library(text2vec)


### Name: GlobalVectors
### Title: Creates Global Vectors word-embeddings model.
### Aliases: GlobalVectors GloVe
### Keywords: datasets

### ** Examples

## Not run: 
##D temp = tempfile()
##D download.file('http://mattmahoney.net/dc/text8.zip', temp)
##D text8 = readLines(unz(temp, "text8"))
##D it = itoken(text8)
##D vocabulary = create_vocabulary(it)
##D vocabulary = prune_vocabulary(vocabulary, term_count_min = 5)
##D v_vect = vocab_vectorizer(vocabulary)
##D tcm = create_tcm(it, v_vect, skip_grams_window = 5L)
##D glove_model = GloVe$new(word_vectors_size = 50,
##D   vocabulary = vocabulary, x_max = 10, learning_rate = .25)
##D # fit model and get word vectors
##D word_vectors_main = glove_model$fit_transform(tcm, n_iter = 10)
##D word_vectors_context = glove_model$components
##D word_vectors = word_vectors_main + t(word_vectors_context)
## End(Not run)



