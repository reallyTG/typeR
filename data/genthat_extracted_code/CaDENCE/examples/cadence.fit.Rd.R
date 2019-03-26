library(CaDENCE)


### Name: cadence.fit
### Title: Fit a CDEN model
### Aliases: cadence.fit

### ** Examples

    data(FraserSediment)
    set.seed(1)
    lnorm.distribution <- list(density.fcn = dlnorm,
                               parameters = c("meanlog", "sdlog"),
                               parameters.fixed = NULL,
                               output.fcns = c(identity, exp))
    fit <- cadence.fit(x = FraserSediment$x.1970.1976[c(TRUE, rep(FALSE, 19)),],
                       y = FraserSediment$y.1970.1976[c(TRUE, rep(FALSE, 19)),,
                       drop=FALSE], n.hidden = 3, n.trials = 1,
                       maxit.Nelder = 100, trace.Nelder = 1, hidden.fcn = tanh,
                       distribution = lnorm.distribution, trace = 1)
    pred <- cadence.predict(x = FraserSediment$x.1977.1979, fit = fit)
    matplot(pred, type = "l")



