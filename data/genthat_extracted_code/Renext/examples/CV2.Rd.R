library(Renext)


### Name: CV2
### Title: Squared Coefficient of Variation
### Aliases: CV2

### ** Examples

n <- 30; nSamp <- 500
X <- matrix(rexp(n * nSamp), nrow= nSamp, ncol = n)
W <- CV2(X)
plot(density(W), main = "CV2 of exponential samples")



