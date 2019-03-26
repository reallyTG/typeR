library(udpipe)


### Name: dtm_remove_terms
### Title: Remove terms from a Document-Term-Matrix and keep only documents
###   which have a least some terms
### Aliases: dtm_remove_terms

### ** Examples

data(brussels_reviews_anno)
x <- subset(brussels_reviews_anno, xpos == "NN")
x <- x[, c("doc_id", "lemma")]
x <- document_term_frequencies(x)
dtm <- document_term_matrix(x)
dim(dtm)
dtm <- dtm_remove_terms(dtm, terms = c("appartement", "casa", "centrum", "ciudad"))
dim(dtm)



