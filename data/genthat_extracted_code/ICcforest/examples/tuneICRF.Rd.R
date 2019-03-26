library(ICcforest)


### Name: tuneICRF
### Title: Tune mtry to the optimal value with respect to out-of-bag error
###   for an ICcforest model
### Aliases: tuneICRF
### Keywords: brier errors, mtry, out-of-bag score

### ** Examples

### Example with dataset tandmob2
library(icenReg)
data(miceData)

## For ICcforest to run, Inf should be set to be a large number, for example, 9999999.
miceData$u[miceData$u == Inf] <- 9999999.

## Create a new variable to be selected from
miceData$new = rep(1:4)

## Tune mtry 
mtryTune <- tuneICRF(Surv(l, u, type = "interval2") ~ grp + new, data = miceData)




