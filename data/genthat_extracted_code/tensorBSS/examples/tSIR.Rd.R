library(tensorBSS)


### Name: tSIR
### Title: SIR for Tensor-Valued Observations
### Aliases: tSIR
### Keywords: multivariate array

### ** Examples

library(ElemStatLearn)
x <- zip.train

rows <- which(x[, 1] == 0 | x[, 1] == 3)
x0 <- x[rows, 2:257]
y0 <- as.factor(x[rows, 1])

x0 <- t(x0)
dim(x0) <- c(16, 16, length(y0))


res <- tSIR(x0, y0)
plot(res$S[1, 1, ], res$S[1, 2, ], col = y0)



