library(breakfast)


### Name: hybrid.cpt
### Title: Multiple change-point detection in the mean of a vector using a
###   hybrid between the TGUH and Adaptive WBS methods.
### Aliases: hybrid.cpt

### ** Examples

teeth <- rep(rep(0:1, each=5), 20)
teeth.noisy <- teeth + rnorm(200)/5
teeth.cleaned <- hybrid.cpt(teeth.noisy)
ts.plot(teeth.cleaned$est)



