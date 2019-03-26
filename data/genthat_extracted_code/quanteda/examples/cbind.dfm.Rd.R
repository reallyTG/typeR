library(quanteda)


### Name: cbind.dfm
### Title: Combine dfm objects by Rows or Columns
### Aliases: cbind.dfm rbind.dfm
### Keywords: dfm internal

### ** Examples

# cbind() for dfm objects
(dfm1 <- dfm(c("a b c d", "c d e f")))
(dfm2 <- dfm(c("a b", "x y z")))
cbind(dfm1, dfm2)
cbind(dfm1, 100)
cbind(100, dfm1)
cbind(dfm1, matrix(c(101, 102), ncol = 1))
cbind(matrix(c(101, 102), ncol = 1), dfm1)


# rbind() for dfm objects
(dfm1 <- dfm(c(doc1 = "This is one sample text sample."), verbose = FALSE))
(dfm2 <- dfm(c(doc2 = "One two three text text."), verbose = FALSE))
(dfm3 <- dfm(c(doc3 = "This is the fourth sample text."), verbose = FALSE))
rbind(dfm1, dfm2)
rbind(dfm1, dfm2, dfm3)



