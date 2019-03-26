library(RcmdrMisc)


### Name: plotDistr
### Title: Plot a probability density, mass, or distribution function.
### Aliases: plotDistr
### Keywords: hplot

### ** Examples

x <- seq(-4, 4, length=100)
plotDistr(x, dnorm(x), xlab="Z", ylab="p(z)", main="Standard Normal Density")
plotDistr(x, dnorm(x), xlab="Z", ylab="p(z)", main="Standard Normal Density",
    region=list(c(1.96, Inf), c(-Inf, -1.96)), col=c("red", "blue"))
plotDistr(x, dnorm(x), xlab="Z", ylab="p(z)", main="Standard Normal Density",
    region=list(c(qnorm(0), qnorm(.025)), c(qnorm(.975), qnorm(1)))) # same 

x <- 0:10
plotDistr(x, pbinom(x, 10, 0.5), xlab="successes", 
    discrete=TRUE, cdf=TRUE,
    main="Binomial Distribution Function, p=0.5, n=10")



