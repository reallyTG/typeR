library(sisal)


### Name: sisal
### Title: Sequential Input Selection Algorithm (SISAL)
### Aliases: sisal
### Keywords: multivariate robust models regression

### ** Examples

library(stats)
set.seed(123)
X <- cbind(sine=sin((1:100)/5),
           linear=seq(from=-1, to=1, length.out=100),
           matrix(rnorm(800), 100, 8,
                  dimnames=list(NULL, paste("random", 1:8, sep="."))))
y <- drop(X %*% c(3, 10, 1, rep(0, 7)) + rnorm(100))
foo <- sisal(X, y, Mtimes=10, kfold=5)
print(foo)           # selected inputs "L.v" are same as
summary(foo$lm.full) # significant coefficients of full model



