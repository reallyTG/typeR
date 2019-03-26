library(udpipe)


### Name: document_term_frequencies
### Title: Aggregate a data.frame to the document/term level by calculating
###   how many times a term occurs per document
### Aliases: document_term_frequencies document_term_frequencies.data.frame
###   document_term_frequencies.character

### ** Examples

##
## Calculate document_term_frequencies on a data.frame
##
data(brussels_reviews_anno)
x <- document_term_frequencies(brussels_reviews_anno[, c("doc_id", "token")])
x <- document_term_frequencies(brussels_reviews_anno[, c("doc_id", "lemma")])
str(x)

brussels_reviews_anno$my_doc_id <- paste(brussels_reviews_anno$doc_id, 
                                         brussels_reviews_anno$sentence_id)
x <- document_term_frequencies(brussels_reviews_anno[, c("my_doc_id", "lemma")])

##
## Calculate document_term_frequencies on a character vector
##
data(brussels_reviews)
x <- document_term_frequencies(x = brussels_reviews$feedback, document = brussels_reviews$id, 
                               split = " ")
x <- document_term_frequencies(x = brussels_reviews$feedback, document = brussels_reviews$id, 
                               split = "[[:space:][:punct:][:digit:]]+")
                               
##
## document-term-frequencies on several fields to easily include bigram and trigrams
##
library(data.table)
x <- as.data.table(brussels_reviews_anno)
x <- x[, token_bigram := txt_nextgram(token, n = 2), by = list(doc_id, sentence_id)]
x <- x[, token_trigram := txt_nextgram(token, n = 3), by = list(doc_id, sentence_id)]
x <- document_term_frequencies(x = x, 
                               document = "doc_id", 
                               term = c("token", "token_bigram", "token_trigram"))
head(x)



