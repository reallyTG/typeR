library(udpipe)


### Name: document_term_matrix
### Title: Create a document/term matrix from a data.frame with 1 row per
###   document/term
### Aliases: document_term_matrix document_term_matrix.data.frame
###   document_term_matrix.DocumentTermMatrix
###   document_term_matrix.TermDocumentMatrix
###   document_term_matrix.simple_triplet_matrix

### ** Examples

x <- data.frame(doc_id = c(1, 1, 2, 3, 4), 
 term = c("A", "C", "Z", "X", "G"), 
 freq = c(1, 5, 7, 10, 0))
document_term_matrix(x)
document_term_matrix(x, vocabulary = LETTERS)

## Example on larger dataset
data(brussels_reviews_anno)
x <- document_term_frequencies(brussels_reviews_anno[, c("doc_id", "lemma")])
dtm <- document_term_matrix(x)
dim(dtm)

## example showing the vocubulary argument
## allowing you to making sure terms which are not in the data are provided in the resulting dtm
allterms <- unique(x$term)
dtm <- document_term_matrix(head(x, 1000), vocabulary = allterms)

##
## Example adding bigrams/trigrams to the document term matrix
## Mark that this can also be done using ?dtm_cbind
##
library(data.table)
x <- as.data.table(brussels_reviews_anno)
x <- x[, token_bigram := txt_nextgram(token, n = 2), by = list(doc_id, sentence_id)]
x <- x[, token_trigram := txt_nextgram(token, n = 3), by = list(doc_id, sentence_id)]
x <- document_term_frequencies(x = x, 
                               document = "doc_id", 
                               term = c("token", "token_bigram", "token_trigram"))
dtm <- document_term_matrix(x)



