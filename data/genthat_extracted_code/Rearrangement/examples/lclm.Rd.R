library(Rearrangement)


### Name: lclm
### Title: Local Constant Estimator for Conditional Mean Functions
### Aliases: lclm
### Keywords: regression

### ** Examples

data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
lclm.fit1 <- lclm(age,height,h=1,xx=ages)

detach(GrowthChart)



