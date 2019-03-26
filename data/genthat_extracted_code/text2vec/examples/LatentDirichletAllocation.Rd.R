library(text2vec)


### Name: LatentDirichletAllocation
### Title: Creates Latent Dirichlet Allocation model.
### Aliases: LatentDirichletAllocation LDA
###   LatentDirichletAllocationDistributed
### Keywords: datasets

### ** Examples

library(text2vec)
data("movie_review")
N = 500
tokens = word_tokenizer(tolower(movie_review$review[1:N]))
it = itoken(tokens, ids = movie_review$id[1:N])
v = create_vocabulary(it)
v = prune_vocabulary(v, term_count_min = 5, doc_proportion_max = 0.2)
dtm = create_dtm(it, vocab_vectorizer(v))
lda_model = LDA$new(n_topics = 10)
doc_topic_distr = lda_model$fit_transform(dtm, n_iter = 20)
# run LDAvis visualisation if needed (make sure LDAvis package installed)
# lda_model$plot()



