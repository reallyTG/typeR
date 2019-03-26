library(Rearrangement)


### Name: lcrq2
### Title: Local Constant Estimator for Conditional Quantile Functions
### Aliases: lcrq2
### Keywords: regression

### ** Examples

require(quantreg)
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
lcq.fit1 <- lcrq2(age,height,h=1,xx=ages,tau=0.01)

detach(GrowthChart)



