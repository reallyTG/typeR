library(dr)


### Name: dr.weights
### Title: Estimate weights for elliptical symmetry
### Aliases: dr.weights
### Keywords: regression

### ** Examples

data(ais)
w1 <- dr.weights(~ Ht +Wt +RCC, data = ais)
m1 <- dr(LBM~Ht+Wt+RCC,data=ais,weights=w1)



