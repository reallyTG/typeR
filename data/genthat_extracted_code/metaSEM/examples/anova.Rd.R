library(metaSEM)


### Name: anova
### Title: Compare Nested Models with Likelihood Ratio Statistic
### Aliases: anova.wls anova.meta anova.meta3X anova.reml anova.osmasem
### Keywords: methods

### ** Examples

## Test the significance of a predictor with likelihood ratio test
## Model0: No predictor
model0 <- meta(y=yi, v=vi, data=Hox02, model.name="No predictor")

## Model1: With a predictor
model1 <- meta(y=yi, v=vi, x=weeks, data=Hox02, model.name="One predictor")

## Compare these two models
anova(model1, model0) 



