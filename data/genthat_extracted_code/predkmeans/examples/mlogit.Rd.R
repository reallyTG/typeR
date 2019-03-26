library(predkmeans)


### Name: mlogit
### Title: Multinomial Logistic Regression
### Aliases: mlogit

### ** Examples

n <- 2000
X <- cbind(1,
           matrix(rnorm(2*n), nrow=n, ncol=2),
           rbinom(n, size=1, prob=0.3))
beta <- cbind(rep(0, 4),
              c(0.5, 1, 0, -1),
              c(0, 2, 2, 0))
probs <- exp(X %*% beta)
probs <- probs/rowSums(probs)
Y <- t(apply(probs, 1, function(p) rmultinom(1, 1, p)))
mfit <- mlogit(Y=Y, X=X, betaOnly=TRUE)
mfit



