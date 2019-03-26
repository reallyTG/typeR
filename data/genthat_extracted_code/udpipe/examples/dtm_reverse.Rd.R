library(udpipe)


### Name: dtm_reverse
### Title: Inverse operation of the document_term_matrix function
### Aliases: dtm_reverse

### ** Examples

x <- data.frame(
 doc_id = c(1, 1, 2, 3, 4), 
 term = c("A", "C", "Z", "X", "G"), 
 freq = c(1, 5, 7, 10, 0))
dtm <- document_term_matrix(x)
dtm_reverse(dtm)



