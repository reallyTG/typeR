library(party)


### Name: reweight
### Title: Re-fitting Models with New Weights
### Aliases: reweight reweight.linearModel reweight.glinearModel
### Keywords: regression

### ** Examples

  ## fit cars regression
  mf <- dpp(linearModel, dist ~ speed, data = cars)
  fm <- fit(linearModel, mf)
  fm
  
  ## re-fit, excluding the last 4 observations
  ww <- c(rep(1, 46), rep(0, 4))
  reweight(fm, ww)



