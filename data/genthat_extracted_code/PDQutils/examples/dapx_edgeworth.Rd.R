library(PDQutils)


### Name: dapx_edgeworth
### Title: Approximate density and distribution via Edgeworth expansion.
### Aliases: dapx_edgeworth papx_edgeworth
### Keywords: distribution

### ** Examples

# normal distribution, for which this is silly
xvals <- seq(-2,2,length.out=501)
d1 <- dapx_edgeworth(xvals, c(0,1,0,0,0,0))
d2 <- dnorm(xvals)
d1 - d2

qvals <- seq(-2,2,length.out=501)
p1 <- papx_edgeworth(qvals, c(0,1,0,0,0,0))
p2 <- pnorm(qvals)
p1 - p2



