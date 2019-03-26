library(spBayes)


### Name: bayesLMRef
### Title: Simple Bayesian linear model with non-informative priors
### Aliases: bayesLMRef
### Keywords: model

### ** Examples

## Not run: 
##D set.seed(1)
##D 
##D n <- 100
##D X <- as.matrix(cbind(1, rnorm(n)))
##D B <- as.matrix(c(1,5))
##D tau.sq <- 0.1
##D y <- rnorm(n, X%*%B, sqrt(tau.sq))
##D 
##D lm.obj <- lm(y ~ X-1)
##D 
##D summary(lm.obj)
##D 
##D ##Now with bayesLMRef
##D n.samples <- 500
##D 
##D m.1 <- bayesLMRef(lm.obj, n.samples)
##D 
##D summary(m.1$p.beta.tauSq.samples)
## End(Not run)



