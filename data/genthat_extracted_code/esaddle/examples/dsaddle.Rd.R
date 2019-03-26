library(esaddle)


### Name: dsaddle
### Title: Evaluating the Extended Empirical Saddlepoint (EES) density
### Aliases: dsaddle

### ** Examples

library(esaddle)

### Simple univariate example
set.seed(4141)
x <- rgamma(1000, 2, 1)

# Evaluating EES at several point
xSeq <- seq(-2, 8, length.out = 200)
tmp <- dsaddle(y = xSeq, X = x, decay = 0.05, log = TRUE)  # Un-normalized EES
tmp2 <- dsaddle(y = xSeq, X = x, decay = 0.05,             # EES normalized by importance sampling
                normalize = TRUE, control = list("method" = "IS", nNorm = 500), log = TRUE)

# Plotting true density, EES and normal approximation
plot(xSeq, exp(tmp$llk), type = 'l', ylab = "Density", xlab = "x")
lines(xSeq, dgamma(xSeq, 2, 1), col = 3)
lines(xSeq, dnorm(xSeq, mean(x), sd(x)), col = 2)
lines(xSeq, exp(tmp2$llk), col = 4)
suppressWarnings( rug(x) )
legend("topright", c("EES un-norm", "EES normalized", "Truth", "Gaussian"), 
        col = c(1, 4, 3, 2), lty = 1)



