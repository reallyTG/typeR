library(brr)


### Name: Beta2Dist
### Title: Beta distribution of the second kind
### Aliases: Beta2Dist dbeta2 pbeta2 qbeta2 rbeta2 summary_beta2

### ** Examples

curve(dbeta2(x, 3, 10, scale=2), from=0, to=3)
u <- rbeta(1e5, 3, 10)
lines(density(2*u/(1-u)), col="blue", lty="dashed")
summary_beta2(3,10,2)



