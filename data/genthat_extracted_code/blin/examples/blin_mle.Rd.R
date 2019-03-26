library(blin)


### Name: blin_mle
### Title: Estimate the BLIN model using maximum likelihood estimator
### Aliases: blin_mle
### Keywords: external

### ** Examples

S <- 5
L <- 4
tmax <- 10
data <- generate_blin(S,L,tmax, lag=2, sparse=.8, seed=1)

fit <- blin_mle(data$Y, data$X, lag=2, calcses=TRUE)
summary(fit)




