library(unbalhaar)


### Name: hard.thresh
### Title: Hard thresholding of a top-down Unbalanced Haar decomposition
### Aliases: hard.thresh
### Keywords: math

### ** Examples

x <- rnorm(1000)
x.uh <- best.unbal.haar(x)
x.uh.th <- hard.thresh(x.uh)
x.uh.th.r <- reconstr(x.uh.th)
ts.plot(x.uh.th.r)



