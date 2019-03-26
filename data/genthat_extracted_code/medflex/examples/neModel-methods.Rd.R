library(medflex)


### Name: neModel-methods
### Title: Methods for natural effect models
### Aliases: neModel-methods coef.neModel confint.neModelBoot
###   confint.neModel residualPlot.neModel residualPlots.neModel
###   summary.neModel vcov.neModel weights.neModel

### ** Examples

data(UPBdata)

weightData <- neWeight(negaff ~ att + educ + gender + age,
                       data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + educ + gender + age, 
                 family = binomial, expData = weightData, se = "robust")

## extract coefficients
coef(neMod)

## extract variance-covariance matrix
vcov(neMod)

## extract regression weights
w <- weights(neMod)
head(w)

## obtain bootstrap confidence intervals
confint(neMod)
confint(neMod, parm = c("att0"))
confint(neMod, type = "perc", level = 0.90)

## summary table
summary(neMod)

## residual plots
library(car)
residualPlots(neMod)



