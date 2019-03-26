library(discSurv)


### Name: devResidShort
### Title: Deviance Residuals
### Aliases: devResidShort
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

# Calculate the deviance residuals
devResiduals <- devResidShort (dataSet=heartLong, hazards=hazPreds)$Output$DevResid

# Compare with estimated normal distribution
plot(density(devResiduals), 
main="Empirical density vs estimated normal distribution", 
las=1, ylim=c(0, 0.5))
tempFunc <- function (x) dnorm(x, mean=mean(devResiduals), sd=sd(devResiduals))
curve(tempFunc, xlim=c(-10, 10), add=TRUE, col="red")
# The empirical density seems like a mixture distribution, 
# but is not too far off in with values greater than 3 and less than 1



