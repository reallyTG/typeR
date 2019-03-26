library(extRemes)


### Name: fevd
### Title: Fit An Extreme Value Distribution (EVD) to Data
### Aliases: fevd plot.fevd plot.fevd.bayesian plot.fevd.lmoments
###   plot.fevd.mle print.fevd summary.fevd summary.fevd.bayesian
###   summary.fevd.lmoments summary.fevd.mle
### Keywords: models univar ts distribution hplot manip optimize print

### ** Examples


z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit
plot(fit)
plot(fit, "trace")

## Not run: 
##D ## Fitting the GEV to block maxima.
##D 
##D # Port Jervis, New York winter maximum and minimum
##D # temperatures (degrees centigrade).
##D data(PORTw)
##D 
##D # Gumbel
##D fit0 <- fevd(TMX1, PORTw, type="Gumbel", units="deg C")
##D fit0
##D plot(fit0)
##D plot(fit0, "trace")
##D return.level(fit0)
##D 
##D # GEV
##D fit1 <- fevd(TMX1, PORTw, units="deg C")
##D fit1
##D plot(fit1)
##D plot(fit1, "trace")
##D return.level(fit1)
##D return.level(fit1, do.ci=TRUE)
##D ci(fit1, return.period=c(2,20,100)) # Same as above.
##D 
##D lr.test(fit0, fit1)
##D ci(fit1, type="parameter")
##D par(mfrow=c(1,1))
##D ci(fit1, type="parameter", which.par=3, xrange=c(-0.4,0.01),
##D     nint=100, method="proflik", verbose=TRUE)
##D 
##D # 100-year return level
##D ci(fit1, method="proflik", xrange=c(22,28), verbose=TRUE)
##D 
##D plot(fit1, "probprob")
##D plot(fit1, "qq")
##D plot(fit1, "hist")
##D plot(fit1, "hist", ylim=c(0,0.25))
##D 
##D # Non-stationary model.
##D # Location as a function of AO index.
##D 
##D fit2 <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
##D fit2
##D plot(fit2)
##D plot(fit2, "trace")
##D # warnings are not critical here.
##D # Sometimes the nllh or gradients
##D # are not defined.
##D 
##D return.level(fit2)
##D 
##D v <- make.qcov(fit2, vals=list(mu1=c(-1, 1)))
##D return.level(fit2, return.period=c(2, 20, 100), qcov=v)
##D 
##D # Note that first row is for AOindex = -1 and second
##D # row is for AOindex = 1.
##D 
##D lr.test(fit1, fit2)
##D # Also compare AIC and BIC
##D 
##D look1 <- summary(fit1, silent=TRUE)
##D look1 <- c(look1$AIC, look1$BIC)
##D 
##D look2 <- summary(fit2, silent=TRUE)
##D look2 <- c(look2$AIC, look2$BIC)
##D 
##D # Lower AIC/BIC is better.
##D names(look1) <- names(look2) <- c("AIC", "BIC")
##D look1
##D look2
##D 
##D par(mfrow=c(1,1))
##D plot(fit2, "rl")
##D 
##D 
##D ## Fitting the GP df to threshold excesses.
##D 
##D # Hurricane damage data.
##D 
##D data(damage)
##D 
##D ny <- tabulate(damage$Year)
##D # Looks like only, at most, 5 obs per year.
##D 
##D ny <- mean(ny[ny > 0])
##D fit0 <- fevd(Dam, damage, threshold=6, type="Exponential", time.units="2.05/year")
##D fit0
##D plot(fit0)
##D plot(fit0, "trace") # ignore the warning.
##D 
##D fit1 <- fevd(Dam, damage, threshold=6, type="GP", time.units="2.05/year")
##D fit1
##D plot(fit1) # ignore the warning.
##D plot(fit1, "trace")
##D 
##D return.level(fit1)
##D 
##D # lr.test(fit0, fit1)
##D 
##D # Fort Collins, CO precipitation
##D 
##D data(Fort)
##D 
##D ## GP df
##D 
##D fit <- fevd(Prec, Fort, threshold=0.395, type="GP", units="inches", verbose=TRUE)
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D 
##D ci(fit, type="parameter")
##D par(mfrow=c(1,1))
##D ci(fit, type="return.level", method="proflik", xrange=c(4,7.5), verbose=TRUE)
##D # Can check using locator(2).
##D 
##D ci(fit, type="parameter", which.par=2, method="proflik", xrange=c(0.1, 0.3),
##D     verbose=TRUE) 
##D # Can check using locator(2).
##D 
##D 
##D ## PP model.
##D 
##D fit <- fevd(Prec, Fort, threshold=0.395, type="PP", units="inches", verbose=TRUE)
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D ci(fit, type="parameter")
##D 
##D # Same thing, but just to try a different optimization method.
##D # And, for fun, a different way of entering the data set.
##D fit <- fevd(Fort$Prec, threshold=0.395, type="PP",
##D     optim.args=list(method="Nelder-Mead"), units="inches", verbose=TRUE)
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D ci(fit, type="parameter")
##D 
##D ## PP model with blocks argument for computational efficiency # CJP2
##D 
##D system.time(fit <- fevd(Prec, Fort, threshold=0.395, type="PP", units="inches", verbose=TRUE))
##D 
##D FortSub = Fort[Fort$Prec > 0.395, ]
##D system.time(fit.blocks <- fevd(Prec, FortSub, threshold=0.395,
##D type="PP", units="inches", blocks = list(nBlocks = 100), verbose=TRUE))
##D fit.blocks
##D plot(fit.blocks)
##D plot(fit.blocks, "trace")
##D ci(fit.blocks, type="parameter")
##D 
##D #
##D # Phoenix data
##D #
##D # Summer only with 62 days per year.
##D 
##D data(Tphap)
##D 
##D plot(MinT~ Year, data=Tphap)
##D 
##D # GP df
##D fit <- fevd(-MinT ~1, Tphap, threshold=-73, type="GP", units="deg F",
##D     time.units="62/year", verbose=TRUE)
##D 
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D 
##D # PP
##D fit <- fevd(-MinT ~1, Tphap, threshold=-73, type="PP", units="deg F", time.units="62/year",
##D     use.phi=TRUE, optim.args=list(method="BFGS", gr=NULL), verbose=TRUE)
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D 
##D 
##D # Non-stationary models
##D 
##D fit <- fevd(Prec, Fort, threshold=0.395,
##D     scale.fun=~sin(2 * pi * (year - 1900)/365.25) + cos(2 * pi * (year - 1900)/365.25),
##D     type="GP", use.phi=TRUE, verbose=TRUE)
##D fit
##D plot(fit)
##D plot(fit, "trace")
##D ci(fit, type="parameter")
##D 
##D # Non-constant threshold.
##D 
##D # GP
##D fit <- fevd(Prec, Fort, threshold=0.475, threshold.fun=~I(-0.15 * cos(2 * pi * month / 12)),
##D     type="GP", verbose=TRUE)
##D fit
##D plot(fit)
##D par(mfrow=c(1,1))
##D plot(fit, "rl", xlim=c(0, 365))
##D 
##D # PP
##D 
##D fit <- fevd(Prec, Fort, threshold=0.475, threshold.fun=~I(-0.15 * cos(2 * pi * month / 12)),
##D     type="PP", verbose=TRUE)
##D fit
##D plot(fit)
##D 
##D ## Bayesian PP with blocks for computational efficiency
##D ## Note that 1999 iterations may not be sufficient; used here to
##D ## minimize time spent fitting.
##D # CJP2
##D ## CJP2: Eric, CRAN won't like this being run as part of the examples
##D ## as it takes a long time; we'll probably want to wrap this in a \dontrun{}
##D 
##D set.seed(0)
##D system.time(fit <- fevd(Prec, Fort, threshold=0.395,
##D     scale.fun=~sin(2 * pi * (year - 1900)/365.25) + cos(2 * pi * (year - 1900)/365.25),
##D     type="PP", method="Bayesian", iter=1999, use.phi=TRUE, verbose=TRUE))
##D fit
##D ci(fit, type="parameter")
##D 
##D set.seed(0)
##D FortSub <- Fort[Fort$Prec > 0.395, ]
##D system.time(fit2 <- fevd(Prec, FortSub, threshold=0.395,
##D     scale.fun=~sin(2 * pi * (year - 1900)/365.25) + cos(2 * pi * (year -
##D 1900)/365.25), type="PP", blocks = list(nBlocks= 100, data =
##D data.frame(year = 1900:1999)), use.phi=TRUE, method = "Bayesian",
##D iter=1999, verbose=TRUE))
##D # an order of magnitude faster
##D 
##D fit2
##D ci(fit2, type="parameter")
##D 
##D data(ftcanmax)
##D 
##D fit <- fevd(Prec, ftcanmax, units="inches")
##D fit
##D 
##D plot(fit)
##D par(mfrow=c(1,1))
##D plot(fit, "probprob")
##D plot(fit, "hist")
##D plot(fit, "hist", ylim=c(0,0.01))
##D plot(fit, "density", ylim=c(0,0.01))
##D plot(fit, "trace")
##D 
##D distill(fit)
##D distill(fit, cov=FALSE)
##D 
##D fit2 <- fevd(Prec, ftcanmax, location.fun=~Year)
##D fit2
##D 
##D plot(fit2)
##D ##
##D # plot(fit2, "trace") # Gives warnings because of some NaNs produced
##D                       # (nothing to worry about).
##D 
##D lr.test(fit, fit2)
##D 
##D ci(fit)
##D ci(fit, type="parameter")
##D 
##D fit0 <- fevd(Prec, ftcanmax, type="Gumbel")
##D fit0
##D 
##D plot(fit0)
##D lr.test(fit0, fit)
##D plot(fit0, "trace")
##D 
##D ci(fit, return.period=c(2, 20, 100))
##D ci(fit, type="return.level", method="proflik", return.period=20, verbose=TRUE)
##D 
##D ci(fit, type="parameter", method="proflik", which.par=3, xrange=c(-0.1,0.5), verbose=TRUE)
##D 
##D # L-moments
##D fitLM <- fevd(Prec, ftcanmax, method="Lmoments", units="inches")
##D fitLM # less info.
##D plot(fitLM)
##D # above is slightly slower because of the parametric bootstrap
##D # for finding CIs in return levels.
##D par(mfrow=c(1,1))
##D plot(fitLM, "density", ylim=c(0,0.01))
##D 
##D # GP model.
##D # CJP2 : fixed so have 744/year (31 days *24 hours/day)
##D 
##D data(Denversp)
##D 
##D fitGP <- fevd(Prec, Denversp, threshold=0.5, type="GP", units="mm",
##D     time.units="744/year", verbose=TRUE)
##D 
##D fitGP
##D plot(fitGP)
##D plot(fitGP, "trace")
##D # you can see the difficulty in getting good numerics here.
##D # the warnings are not a coding problem, but challenges in 
##D # the likelihood for the data.
##D 
##D # PP model.
##D fitPP <- fevd(Prec, Denversp, threshold=0.5, type="PP", units="mm",
##D     time.units="744/year", verbose=TRUE)
##D 
##D fitPP
##D plot(fitPP)
##D plot(fitPP, "trace")
##D 
##D fitPP <- fevd(Prec, Denversp, threshold=0.5, type="PP", optim.args=list(method="Nelder-Mead"),
##D     time.units="744/year", units="mm", verbose=TRUE)
##D fitPP
##D plot(fitPP) # Much better.
##D plot(fitPP, "trace")
##D # Better than above, but can see the difficulty!
##D # Can see the importance of good starting values!
##D 
##D # Try out for small samples
##D # Using one of the data example from Martins and Stedinger (2000)
##D z <- c( -0.3955, -0.3948, -0.3913, -0.3161, -0.1657, 0.3129, 0.3386, 0.5979,
##D     1.4713, 1.8779, 1.9742, 2.0540, 2.6206, 4.9880, 10.3371 )
##D 
##D tmpML <- fevd( z ) # Usual MLE.
##D 
##D # Find 0.999 quantile for the MLE fit.
##D # "True" 0.999 quantile is around 11.79
##D p <- tmpML$results$par
##D qevd( 0.999, loc = p[ 1 ], scale = p[ 2 ], shape = p[ 3 ] )
##D 
##D tmpLM <- fevd(z, method="Lmoments")
##D p <- tmpLM$results
##D qevd( 0.999, loc = p[ 1 ], scale = p[ 2 ], shape = p[ 3 ] )
##D 
##D tmpGML <- fevd(z, method="GMLE")
##D p <- tmpGML$results$par
##D qevd( 0.999, loc = p[ 1 ], scale = p[ 2 ], shape = p[ 3 ] )
##D 
##D plot(tmpLM)
##D dev.new()
##D plot(tmpGML)
##D 
##D # Bayesian
##D fitB <- fevd(Prec, ftcanmax, method="Bayesian", verbose=TRUE)
##D fitB
##D plot(fitB)
##D plot(fitB, "trace")
##D 
##D # Above looks good for scale and shape, but location does not appear to have found its way.
##D fitB <- fevd(Prec, ftcanmax, method="Bayesian", priorParams=list(v=c(1, 10, 10)), verbose=TRUE)
##D fitB
##D plot(fitB)
##D plot(fitB, "trace")
##D 
##D # Better, but what if we start with poor initial values?
##D fitB <- fevd(Prec, ftcanmax, method="Bayesian", priorParams=list(v=c(0.1, 10, 0.1)),
##D     initial=list(location=0, scale=0.1, shape=-0.5)), verbose=TRUE)
##D fitB
##D plot(fitB)
##D plot(fitB, "trace")
##D 
##D ##
##D ## Non-constant threshold.
##D ##
##D data(Tphap)
##D 
##D # Negative of minimum temperatures.
##D plot(-Tphap$MinT)
##D 
##D fitGP2 <- fevd(-MinT ~1, Tphap, threshold=c(-70,-7), threshold.fun=~I((Year - 48)/42), type="GP",
##D     time.units="62/year", verbose=TRUE)
##D fitGP2
##D plot(fitGP2)
##D plot(fitGP2, "trace")
##D par(mfrow=c(1,1))
##D plot(fitGP2, "hist")
##D plot(fitGP2, "rl")
##D 
##D ci(fitGP2, type="parameter")
##D 
##D ##
##D ## Non-stationary models.
##D ##
##D 
##D data(PORTw)
##D 
##D # GEV
##D fitPORTstdmax <- fevd(PORTw$TMX1, PORTw, scale.fun=~STDTMAX, use.phi=TRUE)
##D plot(fitPORTstdmax)
##D plot(fitPORTstdmax, "trace")
##D # One can see how finding the optimum value numerically can be tricky!
##D 
##D # Bayesian
##D fitPORTstdmaxB <- fevd(PORTw$TMX1, PORTw, scale.fun=~STDTMAX, use.phi=TRUE,
##D     method="Bayesian", verbose=TRUE)
##D fitPORTstdmaxB
##D plot(fitPORTstdmaxB)
##D plot(fitPORTstdmaxB, "trace")
##D 
##D # Let us go crazy.
##D fitCrazy <- fevd(PORTw$TMX1, PORTw, location.fun=~AOindex + STDTMAX, scale.fun=~STDTMAX,
##D     shape.fun=~STDMIN, use.phi=TRUE)
##D fitCrazy
##D plot(fitCrazy)
##D plot(fitCrazy, "trace")
##D # With so many parameters, you may need to stretch the device
##D # using your mouse in order to see them well.
##D 
##D ci(fitCrazy, type="parameter", which=2) # Hmmm.  NA NA.  Not good.
##D ci(fitCrazy, type="parameter", which=2, method="proflik", verbose=TRUE)
##D # Above not quite good enough (try to get better bounds).
##D 
##D ci(fitCrazy, type="parameter", which=2, method="proflik", xrange=c(0, 2), verbose=TRUE)
##D # Much better.
##D 
##D 
##D ##
##D ## Center and scale covariate.
##D ##
##D data(Fort)
##D 
##D fitGPcross <- fevd(Prec, Fort, threshold=0.395,
##D     scale.fun=~cos(day/365.25) + sin(day/365.25) + I((year - 1900)/99),
##D     type="GP", use.phi=TRUE, units="inches")
##D 
##D fitGPcross
##D plot(fitGPcross) # looks good!
##D 
##D # Get a closer look at the effective return levels.
##D par(mfrow=c(1,1))
##D plot(fitGPcross, "rl", xlim=c(10000,12000))
##D 
##D lr.test(fitGPfc, fitGPcross)
##D 
## End(Not run)




