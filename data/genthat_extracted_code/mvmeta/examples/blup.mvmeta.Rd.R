library(mvmeta)


### Name: blup.mvmeta
### Title: Best Linear Unbiased Predictions from mvmeta Models
### Aliases: blup.mvmeta blup
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~1,S=berkey98[5:7],data=berkey98)

# ONLY BLUP
blup(model)

# BLUP AND SE
blup(model,se=TRUE)

# SAME AS ABOVE, AGGREGATED BY OUTCOME, WITH PREDICTION INTERVALS
blup(model,se=TRUE,pi=TRUE,aggregate="y")

# WITH VCOV, FORCED TO A LIST
blup(model,se=TRUE,pi=TRUE,vcov=TRUE,aggregate="y")



