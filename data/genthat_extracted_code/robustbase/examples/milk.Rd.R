library(robustbase)


### Name: milk
### Title: Daudin's Milk Composition Data
### Aliases: milk
### Keywords: datasets

### ** Examples

data(milk)
(c.milk <- covMcd(milk))
summarizeRobWeights(c.milk $ mcd.wt)# 19..20 outliers
umilk <- unique(milk) # dropping obs.64 (== obs.63)
summary(cumilk <- covMcd(umilk, nsamp = "deterministic")) # 20 outliers



