library(RRTCS)


### Name: EichhornHayre
### Title: Eichhorn-Hayre model
### Aliases: EichhornHayre
### Keywords: Confidence_interval EichhornHayre Estimation Quantitative
###   Randomized_response Transformed_variable Variance

### ** Examples

data(EichhornHayreData)
dat=with(EichhornHayreData,data.frame(z,Pi))
mu=1.111111
sigma=0.5414886
cl=0.95
#This line returns a warning showing why the variance estimation is not possible.
#See ResamplingVariance for several alternatives.
EichhornHayre(dat$z,mu,sigma,dat$Pi,"mean",cl)



