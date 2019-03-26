library(text2vec)


### Name: vectorizers
### Title: Vocabulary and hash vectorizers
### Aliases: vectorizers vocab_vectorizer hash_vectorizer

### ** Examples

data("movie_review")
N = 100
vectorizer = hash_vectorizer(2 ^ 18, c(1L, 2L))
it = itoken(movie_review$review[1:N], preprocess_function = tolower,
             tokenizer = word_tokenizer, n_chunks = 10)
hash_dtm = create_dtm(it, vectorizer)

it = itoken(movie_review$review[1:N], preprocess_function = tolower,
             tokenizer = word_tokenizer, n_chunks = 10)
v = create_vocabulary(it, c(1L, 1L) )

vectorizer = vocab_vectorizer(v)

it = itoken(movie_review$review[1:N], preprocess_function = tolower,
             tokenizer = word_tokenizer, n_chunks = 10)

dtm = create_dtm(it, vectorizer)



