library(saeRobust)


### Name: bootstrap
### Title: Fit model on Bootstrap sample
### Aliases: bootstrap boot boot,ANY,ANY,integerORnumeric-method
###   boot,rfh,rfhVariance,NULL-method

### ** Examples

data(milk, package = "sae")
milk$samplingVar <- milk$SD^2
modelFit <- rfh(yi ~ as.factor(MajorArea), milk, "samplingVar")
bootstrapCoefs <- bootstrap(modelFit, B = 2, filter = "coefficients")
do.call(rbind, unlist(bootstrapCoefs, FALSE))



