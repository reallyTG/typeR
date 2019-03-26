library(flexmix)


### Name: FLXMRziglm
### Title: FlexMix Interface to Zero Inflated Generalized Linear Models
### Aliases: FLXMRziglm FLXMRziglm-class refit,FLXMRziglm-method
###   FLXreplaceParameters,FLXMRziglm-method
###   FLXgradlogLikfun,FLXMRziglm-method
### Keywords: models

### ** Examples

  data("dmft", package = "flexmix")
  Model <- FLXMRziglm(family = "poisson")
  Fitted <- flexmix(End ~ log(Begin + 0.5) + Gender + Ethnic + Treatment, 
                    model = Model, k = 2 , data = dmft, 
                    control = list(minprior = 0.01))
  summary(refit(Fitted))



