library(bfp)


### Name: scrHpd
### Title: Calculate an SCB from a samples matrix
### Aliases: scrHpd
### Keywords: multivariate htest

### ** Examples

## create some samples
time <- 1:10
nSamples <- 50
samples <- t(replicate(nSamples,
                       time * rnorm(1) + rexp(1))) +
           rnorm(length(time) * nSamples)
matplot(time, t(samples), type="l", lty=1, col=1,
        xlab="time", ylab="response")

## now test the function: 50% credible band
scb <- scrHpd(samples, level=0.5)
matlines(time, t(scb), col=2, lwd=2, lty=1)



