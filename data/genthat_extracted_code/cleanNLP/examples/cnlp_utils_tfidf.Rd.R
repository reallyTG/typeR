library(cleanNLP)


### Name: cnlp_utils_tfidf
### Title: Construct the TF-IDF Matrix from Annotation or Data Frame
### Aliases: cnlp_utils_tfidf cnlp_utils_tf

### ** Examples

require(dplyr)
data(obama)

# Top words in the first Obama S.O.T.U., using all tokens
tfidf <- cnlp_utils_tfidf(obama)
vids <- order(tfidf[1,], decreasing = TRUE)[1:10]
colnames(tfidf)[vids]

# Top words, only using non-proper nouns
tfidf <- cnlp_get_token(obama) %>%
  filter(pos %in% c("NN", "NNS")) %>%
  cnlp_utils_tfidf()
vids <- order(tfidf[1,], decreasing = TRUE)[1:10]
colnames(tfidf)[vids]




