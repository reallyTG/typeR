library(breakfast)


### Name: wbs.thresh.cpt
### Title: Multiple change-point detection in the mean of a vector using
###   the (Adaptive) WBS method, with the number of change-points chosen by
###   thresholding
### Aliases: wbs.thresh.cpt

### ** Examples

teeth <- rep(rep(0:1, each=5), 20)
teeth.noisy <- teeth + rnorm(200)/5
teeth.cleaned <- wbs.thresh.cpt(teeth.noisy)
ts.plot(teeth.cleaned$est)
teeth.cleaned$no.of.cpt
teeth.cleaned$cpt



