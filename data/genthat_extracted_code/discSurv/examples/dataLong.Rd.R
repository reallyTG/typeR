library(discSurv)


### Name: dataLong
### Title: Data Long Transformation
### Aliases: dataLong
### Keywords: datagen

### ** Examples

# Example unemployment data
library(Ecdat)
data(UnempDur)

# Select subsample
subUnempDur <- UnempDur [1:100, ]
head(subUnempDur)

# Convert to long format
UnempLong <- dataLong (dataSet=subUnempDur, timeColumn="spell", censColumn="censor1")
head(UnempLong, 20)

# Is there exactly one observed event of y for each person?
splitUnempLong <- split(UnempLong, UnempLong$obj)
all(sapply(splitUnempLong, function (x) sum(x$y))==subUnempDur$censor1) # TRUE

# Second example: Acute Myelogenous Leukemia survival data
library(survival)
head(leukemia)
leukLong <- dataLong (dataSet=leukemia, timeColumn="time", censColumn="status")
head(leukLong, 30)

# Estimate discrete survival model
estGlm <- glm(formula=y ~ timeInt + x, data=leukLong, family=binomial())
summary(estGlm)

# Estimate survival curves for non-maintained chemotherapy
newDataNonMaintained <- data.frame(timeInt=factor(1:161), x=rep("Nonmaintained"))
predHazNonMain <- predict(estGlm, newdata=newDataNonMaintained, type="response")
predSurvNonMain <- cumprod(1-predHazNonMain)

# Estimate survival curves for maintained chemotherapy
newDataMaintained <- data.frame(timeInt=factor(1:161), x=rep("Maintained"))
predHazMain <- predict(estGlm, newdata=newDataMaintained, type="response")
predSurvMain <- cumprod(1-predHazMain)

# Compare survival curves
plot(x=1:50, y=predSurvMain [1:50], xlab="Time", ylab="S(t)", las=1, 
type="l", main="Effect of maintained chemotherapy on survival of leukemia patients")
lines(x=1:161, y=predSurvNonMain, col="red")
legend("topright", legend=c("Maintained chemotherapy", "Non-maintained chemotherapy"), 
col=c("black", "red"), lty=rep(1, 2))
# The maintained therapy has clearly a positive effect on survival over the time range



