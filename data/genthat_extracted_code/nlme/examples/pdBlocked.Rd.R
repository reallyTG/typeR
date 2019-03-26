library(nlme)


### Name: pdBlocked
### Title: Positive-Definite Block Diagonal Matrix
### Aliases: pdBlocked
### Keywords: models

### ** Examples

pd1 <- pdBlocked(list(diag(1:2), diag(c(0.1, 0.2, 0.3))),
                 nam = list(c("A","B"), c("a1", "a2", "a3")))
pd1



