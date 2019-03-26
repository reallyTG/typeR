library(vegan)


### Name: radfit
### Title: Rank - Abundance or Dominance / Diversity Models
### Aliases: radfit radfit.default radfit.data.frame AIC.radfit
###   AIC.radfit.frame as.rad coef.radfit coef.radfit.frame deviance.radfit
###   deviance.radfit.frame 'logLik, radfit' 'logLik, radfit.frame'
###   fitted.radfit fitted.radfit.frame lines.radline lines.radfit
###   plot.radfit.frame plot.radfit plot.radline plot.rad radlattice
###   points.radline points.radfit summary.radfit.frame rad.preempt
###   rad.lognormal rad.zipf rad.zipfbrot rad.null predict.radline
###   predict.radfit predict.radfit.frame
### Keywords: univar distribution

### ** Examples

data(BCI)
mod <- rad.lognormal(BCI[5,])
mod
plot(mod)
mod <- radfit(BCI[1,])
## Standard plot overlaid for all models
## Preemption model is a line
plot(mod)
## log for both axes: Zipf model is a line
plot(mod, log = "xy")
## Lattice graphics separately for each model
radlattice(mod)
# Take a subset of BCI to save time and nerves
mod <- radfit(BCI[3:5,])
mod
plot(mod, pch=".")



