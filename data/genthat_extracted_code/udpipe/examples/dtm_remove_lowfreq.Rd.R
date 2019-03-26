library(udpipe)


### Name: dtm_remove_lowfreq
### Title: Remove terms occurring with low frequency from a
###   Document-Term-Matrix and documents with no terms
### Aliases: dtm_remove_lowfreq

### ** Examples

data(brussels_reviews_anno)
x <- subset(brussels_reviews_anno, xpos == "NN")
x <- x[, c("doc_id", "lemma")]
x <- document_term_frequencies(x)
dtm <- document_term_matrix(x)


## Remove terms with low frequencies and documents with no terms
x <- dtm_remove_lowfreq(dtm, minfreq = 10)
dim(x)
x <- dtm_remove_lowfreq(dtm, minfreq = 10, maxterms = 25)
dim(x)



