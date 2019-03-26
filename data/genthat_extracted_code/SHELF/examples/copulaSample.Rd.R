library(SHELF)


### Name: copulaSample
### Title: Generate correlated samples from elicited marginal distributions
###   using a multivariate normal copula
### Aliases: copulaSample

### ** Examples

## Not run: 
##D p1 <- c(0.25, 0.5, 0.75)
##D v1 <- c(0.5, 0.55, 0.6)
##D v2 <- c(0.22, 0.3, 0.35)
##D v3 <- c(0.11, 0.15, 0.2)
##D myfit1 <- fitdist(v1, p1, 0, 1)
##D myfit2 <- fitdist(v2, p1, 0, 1)
##D myfit3 <- fitdist(v3, p1, 0, 1)
##D quad.probs <- matrix(0, 3, 3)
##D quad.probs[1, 2] <- 0.4
##D quad.probs[1, 3] <- 0.4
##D quad.probs[2, 3] <- 0.3
##D copulaSample(myfit1, myfit2, myfit3, qp=quad.probs, n=100, d=NULL)
## End(Not run)



