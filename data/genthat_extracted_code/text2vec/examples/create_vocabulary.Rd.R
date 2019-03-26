library(text2vec)


### Name: create_vocabulary
### Title: Creates a vocabulary of unique terms
### Aliases: create_vocabulary vocabulary create_vocabulary.character
###   create_vocabulary.itoken create_vocabulary.list
###   create_vocabulary.itoken_parallel

### ** Examples

data("movie_review")
txt = movie_review[['review']][1:100]
it = itoken(txt, tolower, word_tokenizer, n_chunks = 10)
vocab = create_vocabulary(it)
pruned_vocab = prune_vocabulary(vocab, term_count_min = 10, doc_proportion_max = 0.8,
doc_proportion_min = 0.001, vocab_term_max = 20000)



