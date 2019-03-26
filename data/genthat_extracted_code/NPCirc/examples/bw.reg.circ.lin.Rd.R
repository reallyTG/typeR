library(NPCirc)


### Name: bw.reg.circ.lin
### Title: Cross-validation rule for circular regression estimation
### Aliases: bw.reg.circ.lin bw.reg.circ.circ bw.reg.lin.circ
### Keywords: circular regression

### ** Examples

set.seed(2012)
n <- 100
x <- seq(0,2*pi,length=n)
y <- sin(x)+0.2*rnorm(n)
bw.reg.circ.lin(circular(x), y, method="LL", lower=1, upper=20)
bw.reg.circ.lin(circular(x), y, method="NW", lower=1, upper=20)



