library(Rearrangement)


### Name: lplm
### Title: Local Linear Regression Methods for Conditional Mean Functions
### Aliases: lplm
### Keywords: regression

### ** Examples

data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
lplm.fit1 <- lplm(age,height,h=1,xx=ages)

detach(GrowthChart)



