library(breakfast)


### Name: wbs.K.cpt
### Title: Detecting exactly 'K' change-points in the mean of a vector
###   using the Adaptive WBS method
### Aliases: wbs.K.cpt

### ** Examples

teeth <- rep(rep(0:1, each=5), 20)
teeth.noisy <- teeth + rnorm(200)/5
teeth.cleaned <- wbs.K.cpt(teeth.noisy, 39)
teeth.cleaned$cpt
teeth.cleaned <- wbs.K.cpt(teeth.noisy, 78)
teeth.cleaned$cpt
teeth.cleaned$cpt.sorted



