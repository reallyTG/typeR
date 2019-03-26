library(cleanNLP)


### Name: cnlp_utils_pca
### Title: Compute Principal Components and store as a Data Frame
### Aliases: cnlp_utils_pca

### ** Examples

require(dplyr)
data(obama)

# Get principal components from the non-proper noun lemmas
tfidf <- cnlp_get_token(obama) %>%
  filter(pos %in% c("NN", "NNS")) %>%
  cnlp_utils_tfidf()
pca_doc <- cnlp_utils_pca(tfidf, cnlp_get_document(obama))

# Plot speeches using the first two principal components
plot(pca_doc$PC1, pca_doc$PC2, col = "white")
text(pca_doc$PC1, pca_doc$PC2, label = 2009:2016)




