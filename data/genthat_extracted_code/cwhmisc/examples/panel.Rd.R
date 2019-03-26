library(cwhmisc)


### Name: panel
### Title: Alternative panel functions for lattice plots
### Aliases: panel.cor panel.hist
### Keywords: device hplot

### ** Examples

n <- 1000; a <- rnorm(n,mean=1)
x <- matrix(c(a,a+2*log(runif(n)),a^2+0.2*rnorm(n,mean=1)),nrow = n)
pairs(x,lower.panel=panel.smooth, diag.panel=panel.hist,
upper.panel=panel.cor, labels = c("rnorm","rnorm+log(runif)","rnorm^2"))



