library(flexmix)


### Name: FLXMRlmer
### Title: FlexMix Interface to Linear Mixed Models
### Aliases: FLXMRlmer FLXMRlmer-class FLXMRlmm-class FLXMRlmmfix-class
###   FLXdeterminePostunscaled,FLXMRlmer-method
###   FLXdeterminePostunscaled,FLXMRlmm-method FLXmstep,FLXMRlmer-method
###   FLXmstep,FLXMRlmm-method FLXgetModelmatrix,FLXMRlmer-method
###   FLXgetModelmatrix,FLXMRlmm-method FLXMRlmm FLXgetObs,FLXMRlmm-method
###   FLXmstep,FLXMRlmmfix-method predict,FLXMRlmm-method
###   rFLXM,FLXMRlmm,FLXcomponent-method rFLXM,FLXMRlmm,list-method
### Keywords: models

### ** Examples

id <- rep(1:50, each = 10)
x <- rep(1:10, 50)
sample <- data.frame(y = rep(rnorm(unique(id)/2, 0, c(5, 2)), each = 10) +
                         rnorm(length(id), rep(c(3, 8), each = 10)) +
                         rep(c(0, 3), each = 10) * x,
                     x = x,
                     id = factor(id))
fitted <- flexmix(.~.|id, k = 2, model = FLXMRlmm(y ~ x, random = ~ 1),
                  data = sample, control = list(tolerance = 10^-3),
                  cluster = rep(rep(1:2, each = 10), 25))
parameters(fitted)



