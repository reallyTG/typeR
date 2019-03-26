library(drc)


### Name: earthworms
### Title: Earthworm toxicity test
### Aliases: earthworms
### Keywords: datasets

### ** Examples


## Fitting a logistic regression model
earthworms.m1 <- drm(number/total~dose, weights = total, data = earthworms,
fct = LL.2(), type = "binomial")
modelFit(earthworms.m1)  # a crude goodness-of-fit test

## Fitting an extended logistic regression model 
##  where the upper limit is estimated
earthworms.m2 <- drm(number/total~dose, weights = total, data = earthworms,
fct = LL.3(), type = "binomial")
modelFit(earthworms.m2)  # goodness-of-fit test
# improvement not visible in test!!!

## Comparing model1 and model2 
## (Can the first model be reduced to the second model?)
anova(earthworms.m1, earthworms.m2)




