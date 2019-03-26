library(CaDENCE)


### Name: cadence.predict
### Title: Predict conditional distribution parameters from a fitted CDEN
###   model
### Aliases: cadence.predict cadence.evaluate

### ** Examples

    data(FraserSediment)
    lnorm.distribution.fixed <- list(density.fcn = dlnorm,
                                     parameters = c("meanlog", "sdlog"),
                                     parameters.fixed = "sdlog",
                                     output.fcns = c(identity, exp))
    fit <- cadence.fit(x = FraserSediment$x.1970.1976,
                       y = FraserSediment$y.1970.1976,
                       hidden.fcn = identity, maxit.Nelder = 100,
                       trace.Nelder = 1, trace = 1,
                       distribution = lnorm.distribution.fixed)
    pred <- cadence.predict(x = FraserSediment$x.1977.1979, fit = fit)
    matplot(pred, type = "l")



