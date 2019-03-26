library(CaDENCE)


### Name: gam.style
### Title: GAM-style effects plots for interpreting CDEN models
### Aliases: gam.style

### ** Examples

    data(FraserSediment)
    set.seed(1)
    lnorm.distribution <- list(density.fcn = dlnorm,
                               parameters = c("meanlog", "sdlog"),
                               parameters.fixed = NULL,
                               output.fcns = c(identity, exp))
    x <- FraserSediment$x.1970.1976[c(TRUE, rep(FALSE, 24)),]
    y <- FraserSediment$y.1970.1976[c(TRUE, rep(FALSE, 24)),,drop=FALSE]
    fit.nlin <- cadence.fit(x, y, n.hidden = 2, n.trials = 1,
                            hidden.fcn = tanh, distribution =
                            lnorm.distribution, maxit.Nelder = 100,
                            trace.Nelder = 1, trace = 1)
    fit.lin <- cadence.fit(x, y, hidden.fcn = identity, n.trials = 1,
                           distribution = lnorm.distribution,
                           maxit.Nelder = 100, trace.Nelder = 1,
                           trace = 1)
    gam.style(x, fit = fit.nlin[[1]], column = 1,
              main = "Nonlinear")
    gam.style(x, fit = fit.lin[[1]], column = 1,
              additive.scale = TRUE,
              main = "Linear (additive.scale = TRUE)")



