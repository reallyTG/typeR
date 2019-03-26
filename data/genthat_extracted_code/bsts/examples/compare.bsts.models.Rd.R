library(bsts)


### Name: compare.bsts.models
### Title: Compare bsts models
### Aliases: CompareBstsModels
### Keywords: chron

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  trend.only <- bsts(y, ss, niter = 500)

  ss <- AddSeasonal(ss, y, nseasons = 12)
  trend.and.seasonal <- bsts(y, ss, niter = 500)

  CompareBstsModels(list(trend = trend.only,
                         "trend and seasonal" = trend.and.seasonal))

  CompareBstsModels(list(trend = trend.only,
                         "trend and seasonal" = trend.and.seasonal),
                          cutpoint = 100)




