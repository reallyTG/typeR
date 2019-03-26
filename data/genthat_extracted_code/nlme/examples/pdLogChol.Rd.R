library(nlme)


### Name: pdLogChol
### Title: General Positive-Definite Matrix
### Aliases: pdLogChol
### Keywords: models

### ** Examples

(pd1 <- pdLogChol(diag(1:3), nam = c("A","B","C")))

(pd4 <- pdLogChol(1:6))
(pd4c <- chol(pd4)) # -> upper-tri matrix with off-diagonals  4 5 6
pd4c[upper.tri(pd4c)]
log(diag(pd4c)) # 1 2 3



