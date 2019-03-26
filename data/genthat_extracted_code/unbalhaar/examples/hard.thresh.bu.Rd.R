library(unbalhaar)


### Name: hard.thresh.bu
### Title: Hard thresholding of a bottom-up Unbalanced Haar decomposition
### Aliases: hard.thresh.bu
### Keywords: math

### ** Examples

x <- rnorm(1000)
x.uh <- best.unbal.haar.bu(x)
x.uh.th <- hard.thresh.bu(x.uh)
x.uh.th.r <- reconstr.bu(x.uh.th)
ts.plot(x.uh.th.r)



