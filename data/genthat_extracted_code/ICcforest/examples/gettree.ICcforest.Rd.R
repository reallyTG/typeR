library(ICcforest)


### Name: gettree.ICcforest
### Title: Extract an individual tree from an ICcforest object
### Aliases: gettree.ICcforest

### ** Examples


#### Example with dataset miceData
library(icenReg)
data(miceData)

## For ICcforest to run, Inf should be set to be a large number, for example, 9999999.
idx_inf <- (miceData$u == Inf)
miceData$u[idx_inf] <- 9999999.

## First, fit an iterval-censored conditional inference forest
Cforest <- ICcforest(formula = Surv(l,u,type="interval2")~grp, data = miceData, ntree = 50L)
## Extract the 50-th tree from the forest
plot(gettree(Cforest, tree = 50L))




