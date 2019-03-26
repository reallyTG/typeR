library(udpipe)


### Name: document_term_frequencies_statistics
### Title: Add Term Frequency, Inverse Document Frequency and Okapi BM25
###   statistics to the output of document_term_frequencies
### Aliases: document_term_frequencies_statistics

### ** Examples

data(brussels_reviews_anno)
x <- document_term_frequencies(brussels_reviews_anno[, c("doc_id", "token")])
x <- document_term_frequencies_statistics(x)
head(x)



