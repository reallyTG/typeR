library(udpipe)


### Name: dtm_colsums
### Title: Column sums and Row sums for document term matrices
### Aliases: dtm_colsums dtm_rowsums dtm_rowsums

### ** Examples

x <- data.frame(
 doc_id = c(1, 1, 2, 3, 4), 
 term = c("A", "C", "Z", "X", "G"), 
 freq = c(1, 5, 7, 10, 0))
dtm <- document_term_matrix(x)
x <- dtm_colsums(dtm)
x
x <- dtm_rowsums(dtm)
head(x)



