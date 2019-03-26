library(discSurv)


### Name: estSurv
### Title: Estimated Survival Function
### Aliases: estSurv
### Keywords: survival

### ** Examples


# Example unemployment data
library(Ecdat)
data(UnempDur)

# Select subsample
subUnempDur <- UnempDur [1:100, ]

# Convert to long format
UnempLong <- dataLong (dataSet=subUnempDur, timeColumn="spell", censColumn="censor1")
head(UnempLong)

# Estimate binomial model with logit link
Fit <- glm(formula=y ~ timeInt + age + logwage, data=UnempLong, family=binomial())

# Estimate discrete survival function given age, logwage of first person
hazard <- predict(Fit, newdata=subset(UnempLong, obj==1), type="response")
SurvivalFuncCondX <- estSurv(c(hazard, 1))
SurvivalFuncCondX




