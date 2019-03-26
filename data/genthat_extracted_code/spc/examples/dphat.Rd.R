library(spc)


### Name: dphat
### Title: Percent defective for normal samples
### Aliases: dphat pphat qphat
### Keywords: ts

### ** Examples

# Figures 1 (c) and (d) from Knoth/Steinmetz (2013)
n      <-  5
LSL    <- -3
USL    <-  3

par(mar=c(5, 5, 1, 1) + 0.1)

p.star <- 2*pnorm( (LSL-USL)/2 ) # for p <= p.star pdf and cdf vanish

p_ <- seq(p.star+1e-10, 0.07, 0.0001) # define support of Figure 1

# Figure 1 (c)
pp_ <- pphat(p_, n)
plot(p_, pp_, type="l", xlab="p", ylab=expression(P( hat(p) <= p )),
     xlim=c(0, 0.06), ylim=c(0,1), lwd=2)
abline(h=0:1, v=p.star, col="grey")

# Figure 1 (d)
dp_ <- dphat(p_, n)
plot(p_, dp_, type="l", xlab="p", ylab="f(p)", xlim=c(0, 0.06),
     ylim=c(0,50), lwd=2)
abline(h=0, v=p.star, col="grey")



