library(bda)


### Name: fit.Weibull
### Title: Two-parameter Weibull Distribution Maximum Likelihood Estimation
### Aliases: fit.Weibull fit.Weibull.bdata fit.Weibull.default
###   fit.Weibull.histogram print.GWD plot.GWD lines.GWD
### Keywords: distribution stats

### ** Examples

  ## raw data
  x <- rweibull(100, 2, 1)
  fit.Weibull(x)
  ##  binned data
  data(hhi)
  hmob <- binning(counts=hhi$mob, breaks=hhi$breaks)
  fit.Weibull(hmob, dist="weibull")
  fit.Weibull(hmob, dist="gwd")
  fit.Weibull(hmob, dist="ewd")




