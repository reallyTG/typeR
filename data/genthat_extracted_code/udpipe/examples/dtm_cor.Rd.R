library(udpipe)


### Name: dtm_cor
### Title: Pearson Correlation for Sparse Matrices
### Aliases: dtm_cor

### ** Examples

x <- data.frame(
 doc_id = c(1, 1, 2, 3, 4), 
 term = c("A", "C", "Z", "X", "G"), 
 freq = c(1, 5, 7, 10, 0))
dtm <- document_term_matrix(x)
dtm_cor(dtm)



