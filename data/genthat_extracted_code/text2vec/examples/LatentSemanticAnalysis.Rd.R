library(text2vec)


### Name: LatentSemanticAnalysis
### Title: Latent Semantic Analysis model
### Aliases: LatentSemanticAnalysis LSA
### Keywords: datasets

### ** Examples

data("movie_review")
N = 100
tokens = word_tokenizer(tolower(movie_review$review[1:N]))
dtm = create_dtm(itoken(tokens), hash_vectorizer())
n_topics = 10
lsa_1 = LatentSemanticAnalysis$new(n_topics)
d1 = lsa_1$fit_transform(dtm)
# the same, but wrapped with S3 methods
d2 = fit_transform(dtm, lsa_1)




