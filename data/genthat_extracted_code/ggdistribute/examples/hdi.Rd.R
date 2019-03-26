library(ggdistribute)


### Name: hdi
### Title: Highest density interval
### Aliases: hdi

### ** Examples

x <- qnorm(seq(1e-04, .9999, length.out=1001))
hdi_95 <- hdi(x, .95)
hdi_50 <- hdi(x, .50)

hist(x, br=50)
abline(v=hdi_95, col="red")
abline(v=hdi_50, col="green")

x <- exp(seq(pi * (1 - (1/16)), pi, len = 1000))
x <- c(x, rev(x)[-1])
x <- c(-x, x)
plot(sort(x), type="l")
plot(density(x, adjust=0.25))
abline(v=hdi(x, p=.49), col=2)
abline(v=hdi(x, p=.50), col=3)



