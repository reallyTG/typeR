library(PLordprob)


### Name: ordprob.mple
### Title: Maximum Pairwise Likelihood Estimation
### Aliases: ordprob.mple

### ** Examples

library(mnormt)

## Not run: 
##D # constrained polychoric correlation matrix
##D sigma <- matrix(0.6,5,5)
##D diag(sigma) <- 1
##D set.seed(123)
##D y <- rmnorm(50, varcov=0.5*sigma)
##D y <- floor(y)+3
##D fit <- ordprob.mple(y, K=4, same.mean=TRUE)
##D #polychoric correlations
##D fit$cor
##D 
##D # unconstrained polychoric correlation matrix
##D set.seed(1)
##D S <- matrix(rWishart(1, df=5, Sigma=diag(1,5)), 5, 5)
##D prec <- diag(1/sqrt(diag(S)))
##D cor <- prec%*%S%*%prec
##D sigma <- cor
##D set.seed(123)
##D y=rmnorm(70, c(1,1,0,0,0), varcov=sigma)
##D y=floor(y)+4
##D fit <- ordprob.mple(y, K=7, same.mean=FALSE)
##D #polychoric correlations
##D fit$cor
## End(Not run)



