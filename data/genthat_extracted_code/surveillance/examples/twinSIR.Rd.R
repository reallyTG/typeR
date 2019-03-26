library(surveillance)


### Name: twinSIR
### Title: Fit an Additive-Multiplicative Intensity Model for SIR Data
### Aliases: twinSIR
### Keywords: models optimize

### ** Examples

# see vignette("twinSIR") for an example with a real data set

# here is an artificial event history
data("fooepidata")
summary(fooepidata)

# fit an overall constant baseline hazard rate
fit1 <- twinSIR(~ B1 + B2 + cox(z2), data = fooepidata)
fit1
summary(fit1)

# fit1 is what is used as data("foofit") in other examples
data("foofit")
stopifnot(all.equal(fit1, foofit))

# fit a piecewise constant baseline hazard rate with 3 intervals using 
# _un_penalized ML and estimated coefs from fit1 as starting values 
fit2 <- twinSIR(~ B1 + B2 + cox(z2), data = fooepidata, nIntervals = 3,
    optim.args = list(par=c(coef(fit1)[1:2],rep(coef(fit1)[3],3),coef(fit1)[4])))
fit2
summary(fit2)

# fit a piecewise constant baseline hazard rate with 9 intervals
# using _penalized_ ML and estimated coefs from fit1 as starting values 
fit3 <- twinSIR(~ B1 + B2 + cox(z2), data = fooepidata, nIntervals = 9,
    lambda.smooth = 0.1, penalty = 1, optim.args = list(
        par=c(coef(fit1)[1:2], rep(coef(fit1)[3],9), coef(fit1)[4])))
fit3
summary(fit3)

# plot the estimated log-baseline levels
plot(x=fit2$intervals, y=coef(fit2)[c(3,3:5)], type="S", xlim=c(0,10))
lines(x=fit3$intervals, y=coef(fit3)[c(3,3:11)], type="S", col=2)
legend("right", legend=c("unpenalized 3", "penalized 9"), lty=1, col=1:2, bty="n")

## -> see help('plot.twinSIR') for intensity plots

## special use case: fit the model to a subset of the events only,
## while preserving epidemic contributions from the remainder
## (maybe some buffer area nodes)
fit_subset <- twinSIR(~ B1 + B2 + cox(z2), data = fooepidata, subset = z1 == 1)
summary(fit_subset)

## Don't show: 
    ## the eventTimes attribute was wrong in surveillance <= 1.15.0
    stopifnot(
        length(residuals(fit_subset)) == sum(fit_subset$model$survs$event)
    )
## End(Don't show)



