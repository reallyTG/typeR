library(bsts)


### Name: mixed.frequency
### Title: Models for mixed frequency time series
### Aliases: bsts.mixed
### Keywords: models regression

### ** Examples

  data <- SimulateFakeMixedFrequencyData(nweeks = 104, xdim = 20)

  ## Setting an upper limit on the standard deviations can help keep the
  ## MCMC from flying off to infinity.
  sd.limit <- sd(data$coarse.target)
  state.specification <-
       AddLocalLinearTrend(list(),
                     data$coarse.target,
                     level.sigma.prior = SdPrior(1.0, 5, upper.limit = sd.limit),
                     slope.sigma.prior = SdPrior(.5, 5, upper.limit = sd.limit))
  weeks <- index(data$predictor)
  months <- index(data$coarse.target)
  which.month <- MatchWeekToMonth(weeks, months[1])
  membership.fraction <- GetFractionOfDaysInInitialMonth(weeks)
  contains.end <- WeekEndsMonth(weeks)

  model <- bsts.mixed(target.series = data$coarse.target,
                      predictors = data$predictors,
                      membership.fraction = membership.fraction,
                      contains.end = contains.end,
                      which.coarse = which.month,
                      state.specification = state.specification,
                      niter = 500,
                      expected.r2 = .999,
                      prior.df = 1)

  plot(model, "state")
  plot(model, "components")




