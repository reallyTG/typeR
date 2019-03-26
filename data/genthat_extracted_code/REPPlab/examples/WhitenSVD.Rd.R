library(REPPlab)


### Name: WhitenSVD
### Title: Whitening Data Using Singular Value Decomposition
### Aliases: WhitenSVD
### Keywords: multivariate

### ** Examples


# more observations than variables
X <- matrix(rnorm(200),ncol=4)
A <- WhitenSVD(X)
round(colMeans(A),4)
round(cov(A),4)
# how to backtransform
summary(sweep(A %*% (attr(A,"backtransform")), 2, attr(A,"center"), "+") - X)

# fewer observations than variables
Y <- cbind(rexp(4),runif(4),rnorm(4), runif(4), rnorm(4), rt(4,4))
B <- WhitenSVD(Y)
round(colMeans(B),4)
round(cov(B),4)
# how to backtransform
summary(sweep(B %*% (attr(B,"backtransform")), 2, attr(B,"center"), "+") - Y)





