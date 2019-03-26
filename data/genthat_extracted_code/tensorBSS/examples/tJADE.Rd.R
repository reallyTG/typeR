library(tensorBSS)


### Name: tJADE
### Title: tJADE for Tensor-Valued Observations
### Aliases: tJADE
### Keywords: multivariate array

### ** Examples

n <- 1000
S <- t(cbind(rexp(n)-1,
             rnorm(n),
             runif(n, -sqrt(3), sqrt(3)),
             rt(n,5)*sqrt(0.6),
             (rchisq(n,1)-1)/sqrt(2),
             (rchisq(n,2)-2)/sqrt(4)))
             
dim(S) <- c(3, 2, n)

A1 <- matrix(rnorm(9), 3, 3)
A2 <- matrix(rnorm(4), 2, 2)

X <- tensorTransform(S, A1, 1)
X <- tensorTransform(X, A2, 2)

tjade <- tJADE(X)

MD(tjade$W[[1]], A1)
MD(tjade$W[[2]], A2) 
tMD(tjade$W, list(A1, A2))

## Not run: 
##D # Digit data example
##D # Running will take a few minutes
##D 
##D library(ElemStatLearn)
##D x <- zip.train
##D 
##D rows <- which(x[, 1] == 0 | x[, 1] == 1)
##D x0 <- x[rows, 2:257]
##D y0 <- x[rows, 1] + 1
##D 
##D x0 <- t(x0)
##D dim(x0) <- c(16, 16, 2199)
##D 
##D tjade <- tJADE(x0)
##D plot(tjade, col=y0)
## End(Not run)




