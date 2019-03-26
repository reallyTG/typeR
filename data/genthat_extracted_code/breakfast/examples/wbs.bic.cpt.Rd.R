library(breakfast)


### Name: wbs.bic.cpt
### Title: Multiple change-point detection in the mean of a vector using
###   the WBS method, with the number of change-points chosen by BIC
### Aliases: wbs.bic.cpt

### ** Examples

teeth <- rep(rep(0:1, each=5), 20)
teeth.noisy <- teeth + rnorm(200)/5
teeth.cleaned <- wbs.bic.cpt(teeth.noisy)
ts.plot(teeth.cleaned$est)
teeth.cleaned$no.of.cpt
teeth.cleaned$cpt



