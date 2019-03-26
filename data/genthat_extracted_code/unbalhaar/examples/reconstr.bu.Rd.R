library(unbalhaar)


### Name: reconstr.bu
### Title: Reconstruct a bottom-up Unbalanced Haar decomposition
### Aliases: reconstr.bu
### Keywords: math

### ** Examples

x <- rnorm(1000)
x.uh <- best.unbal.haar.bu(x)
x.uh.th <- hard.thresh.bu(x.uh)
x.uh.th.r <- reconstr.bu(x.uh.th)
ts.plot(x.uh.th.r)



