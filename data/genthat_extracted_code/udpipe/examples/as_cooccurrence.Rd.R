library(udpipe)


### Name: as_cooccurrence
### Title: Convert a matrix to a co-occurrence data.frame
### Aliases: as_cooccurrence

### ** Examples

data(brussels_reviews_anno)
x <- subset(brussels_reviews_anno, language == "nl")
dtm <- document_term_frequencies(x = x, document = "doc_id", term = "token")
dtm <- document_term_matrix(dtm)

correlation <- dtm_cor(dtm)
cooc <- as_cooccurrence(correlation)
head(cooc)



