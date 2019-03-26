library(surveillance)


### Name: hhh4_validation
### Title: Predictive Model Assessment for 'hhh4' Models
### Aliases: oneStepAhead quantile.oneStepAhead confint.oneStepAhead
###   plot.oneStepAhead scores.oneStepAhead scores.hhh4
###   calibrationTest.oneStepAhead calibrationTest.hhh4 pit.oneStepAhead
###   pit.hhh4
### Keywords: univar htest dplot ts

### ** Examples

### univariate salmonella agona count time series

data("salmonella.agona")
## convert from old "disProg" to new "sts" class
salmonella <- disProg2sts(salmonella.agona)

## generate formula for temporal and seasonal trends
f.end <- addSeason2formula(~1 + t, S=1, period=52)
model <- list(ar = list(f = ~1), end = list(f = f.end), family = "NegBin1")
## fit the model
result <- hhh4(salmonella, model)

## do sequential one-step-ahead predictions for the last 5 weeks
pred <- oneStepAhead(result, nrow(salmonella)-5, type="rolling",
                     which.start="final", verbose=FALSE)
pred
quantile(pred)
confint(pred)

## simple plot of the 95% one-week-ahead prediction interval
## and point forecasts
plot(pred, probs = c(2.5,97.5)/100, means.args = list())

## Don't show: 
## test equivalence of parallelized version
if (.Platform$OS.type == "unix" && isTRUE(parallel::detectCores() > 1))
    stopifnot(identical(pred,
        oneStepAhead(result, nrow(salmonella)-5, type="rolling",
                     which.start="final", verbose=FALSE, cores=2)))
## End(Don't show)

## note: oneStepAhead(..., type="final") just means fitted values
stopifnot(identical(
    unname(oneStepAhead(result, nrow(salmonella)-5,
                        type="final", verbose=FALSE)$pred),
    unname(tail(fitted(result), 5))))


## compute scores of the one-step-ahead predictions
(sc <- scores(pred))

## the above uses the scores-method for "oneStepAhead" predictions,
## which is a simple wrapper around the default method:
scores(x = pred$observed, mu = pred$pred, size = exp(pred$psi))

## scores with respect to the fitted values are similar
(scFitted <- scores(result, subset = nrow(salmonella)-(4:0)))

## Don't show: 
## test that scFitted is equivalent to scores(oneStepAhead(..., type = "final"))
stopifnot(all.equal(
    scFitted,
    scores(oneStepAhead(result, nrow(salmonella)-5, type="final", verbose=FALSE)),
    check.attributes = FALSE))
## End(Don't show)


## test if the one-step-ahead predictions are calibrated
calibrationTest(pred)  # p = 0.8746

## the above uses the calibrationTest-method for "oneStepAhead" predictions,
## which is a simple wrapper around the default method:
calibrationTest(x = pred$observed, mu = pred$pred, size = exp(pred$psi))

## we can also test calibration of the fitted values
## using the calibrationTest-method for "hhh4" fits
calibrationTest(result, subset = nrow(salmonella)-(4:0))


## plot a (non-randomized) PIT histogram for the predictions
pit(pred)

## the above uses the pit-method for "oneStepAhead" predictions,
## which is a simple wrapper around the default method:
pit(x = pred$observed, pdistr = "pnbinom", mu = pred$pred, size = exp(pred$psi))


### multivariate measles count time series
## (omitting oneStepAhead forecasts here to keep runtime low)

data("measlesWeserEms")

## fit a hhh4 model with random effects in the endemic component
measlesModel <- list(
    end = list(f = addSeason2formula(~0 + ri(type="iid"))),
    ar = list(f = ~1),
    ne = list(f = ~1, weights = W_powerlaw(maxlag = 5)),
    family = "NegBin1")
measlesFit <- hhh4(measlesWeserEms, control = measlesModel)

## plot fitted mean components
plot(measlesFit, units = NULL)

## assess overall (in-sample) calibration of the model, i.e.,
## if the observed counts are from the fitted NegBin distribution
calibrationTest(measlesFit) # default is DSS (not suitable for low counts)
calibrationTest(measlesFit, which = "rps")  # p = 0.8267
calibrationTest(measlesFit, which = "logs") # p = 0.636

## to assess calibration in the second year for a specific district
calibrationTest(measlesFit, subset = 53:104, units = "03452", which = "rps")
pit(measlesFit, subset = 53:104, units = "03452")


### For a more sophisticated multivariate analysis of
### areal time series of influenza counts - data("fluBYBW") -
### see the (computer-intensive) demo("fluBYBW") script:
demoscript <- system.file(file.path("demo", "fluBYBW.R"),
                          package = "surveillance")
demoscript
#file.show(demoscript)



