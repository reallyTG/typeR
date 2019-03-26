library(bfp)


### Name: empiricalHpd
### Title: Construct an empirical HPD interval from samples
### Aliases: empiricalHpd
### Keywords: htest

### ** Examples

## draw standard normal variates
test <- rnorm(n=1000)

## estimate the 95% HPD interval with these samples:
empiricalHpd(theta=test, level=0.95)

## compare with true HPD:
qnorm(p=c(0.025, 0.975))



