library(breakfast)


### Name: wbs.cpt
### Title: Multiple change-point detection in the mean of a vector using
###   the (Adaptive) WBS method.
### Aliases: wbs.cpt

### ** Examples

teeth <- rep(rep(0:1, each=5), 20)
teeth.noisy <- teeth + rnorm(200)/5
teeth.cleaned <- wbs.cpt(teeth.noisy)
ts.plot(teeth.cleaned$est)



