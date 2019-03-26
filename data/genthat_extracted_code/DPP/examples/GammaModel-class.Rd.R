library(DPP)


### Name: GammaModel-class
### Title: Class '"GammaModel"'
### Aliases: GammaModel
### Keywords: classes

### ** Examples

#creating an object of the class NormalModel
gamma.model<-new(GammaModel,
                    shape_prior_mean=4,
                    shape_prior_sd=1,
                    rate_prior_mean=1.5,
                    rate_prior_sd=0.54,
                    estimate_concentration_parameter=TRUE,
                    concentration_parameter_alpha=10,
                    proposal_disturbance_sd=0.1)
gamma.model$getParameters()



