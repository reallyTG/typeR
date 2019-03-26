library(discSurv)


### Name: adjDevResidShort
### Title: Adjusted Deviance Residuals in short format
### Aliases: adjDevResidShort
### Keywords: survival

### ** Examples

library(survival)

# Transform data to long format
heart[, "stop"] <- ceiling(heart[, "stop"])
set.seed(0)
Indizes <- sample(unique(heart$id), 25)
randSample <- heart[unlist(sapply(1:length(Indizes), 
function(x) which(heart$id==Indizes[x]))),]
heartLong <- dataLongTimeDep(dataSet=randSample, 
timeColumn="stop", censColumn="event", idColumn="id", timeAsFactor=FALSE)

# Fit a generalized, additive model and predict hazard rates on data in long format
library(mgcv)
gamFit <- gam(y ~ timeInt + surgery + transplant + s(age), data=heartLong, family="binomial")
hazPreds <- predict(gamFit, type="response")

# Calculate adjusted deviance residuals
devResiduals <- adjDevResidShort (dataSet=heartLong, hazards=hazPreds)$Output$AdjDevResid
devResiduals



