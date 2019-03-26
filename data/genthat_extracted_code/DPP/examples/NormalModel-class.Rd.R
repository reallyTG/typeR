library(DPP)


### Name: NormalModel-class
### Title: Class '"NormalModel"'
### Aliases: NormalModel
### Keywords: classes

### ** Examples

#creating an object of the class NormalModel
normal.model<-new(NormalModel,
                  mean_prior_mean=0.5,
                  mean_prior_sd=0.1,
                  sd_prior_shape=3,
                  sd_prior_rate=20,
                  estimate_concentration_parameter=TRUE,
                  concentration_parameter_alpha=10,
                  proposal_disturbance_sd=0.1)
normal.model$getParameters()



