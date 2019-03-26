library(ICcforest)


### Name: ICcforest
### Title: Fit a conditional inference forest for interval-censored
###   survival data
### Aliases: ICcforest
### Keywords: Ensemble conditional data forest, inference interval-censored
###   method,

### ** Examples

#### Example with miceData
library(icenReg)
data(miceData)

## For ICcforest to run, Inf should be set to be a large number, for example, 9999999.
miceData$u[miceData$u == Inf] <- 9999999.

## Fit an iterval-censored conditional inference forest
Cforest <- ICcforest(Surv(l, u, type = "interval2") ~ grp, data = miceData)




