library(bsts)


### Name: plot.bsts.mixed
### Title: Plotting functions for mixed frequency Bayesian structural time
###   series
### Aliases: plot.bsts.mixed PlotBstsMixedComponents PlotBstsMixedState

### ** Examples

## Not run: 
##D ## This example is flaky and needs to be fixed
##D   data <- SimulateFakeMixedFrequencyData(nweeks = 104, xdim = 20)
##D   state.specification <- AddLocalLinearTrend(list(), data$coarse.target)
##D   weeks <- index(data$predictor)
##D   months <- index(data$coarse.target)
##D   which.month <- MatchWeekToMonth(weeks, months[1])
##D   membership.fraction <- GetFractionOfDaysInInitialMonth(weeks)
##D   contains.end <- WeekEndsMonth(weeks)
##D 
##D   model <- bsts.mixed(target.series = data$coarse.target,
##D                       predictors = data$predictors,
##D                       membership.fraction = membership.fraction,
##D                       contains.end = contains.end,
##D                       which.coarse = which.month,
##D                       state.specification = state.specification,
##D                       niter = 500)
##D 
##D   plot(model, "state")
##D   plot(model, "components")
## End(Not run)



