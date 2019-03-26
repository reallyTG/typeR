library(lmomco)


### Name: gen.freq.curves
### Title: Plot Randomly Generated Frequency Curves from a Parent
###   Distribution
### Aliases: gen.freq.curves
### Keywords: misc Graphics

### ** Examples

## Not run: 
##D # 1-day rainfall Travis county, Texas
##D para <- vec2par(c(3.00, 1.20, -.0954), type="gev")
##D F <- .99 # the 100-year event
##D n <- 46 # sample size derived from 75th percentile of record length distribution
##D # for Edwards Plateau from Figure 3 of USGS WRIR98-4044 (Asquith, 1998)
##D # Argument for 75th percentile is that the contours of distribution parameters
##D # in that report represent a regionalization of the parameters and hence
##D # record lengths such as the median or smaller for the region seem too small
##D # for reasonable exploration of confidence limits of precipitation.
##D nsim <- 5000 # simulation size
##D seed <- runif(1, min=1, max=10000)
##D set.seed(seed)
##D CI <- genci.simple(para, n, F=F, nsim=nsim, edist="nor")
##D lo.nor <- CI$lower; hi.nor <- CI$upper
##D 
##D set.seed(seed)
##D CI <- genci.simple(para, n, F=F, nsim=nsim, edist="aep4")
##D lo.aep4 <- CI$lower; hi.aep4 <- CI$upper
##D message("NORMAL ERROR DIST: lowerCI = ",lo.nor, " and upperCI = ",hi.nor)
##D message("  AEP4 ERROR DIST: lowerCI = ",lo.aep4," and upperCI = ",hi.aep4)
##D qF <- qnorm(F)
##D # simulated are grey, parent is black
##D set.seed(seed)
##D counts.nor  <- gen.freq.curves(n, para, nsim=nsim,
##D                    asprob=TRUE, showparent=TRUE, col=rgb(0,0,1,0.025),
##D                    lowerCI=lo.nor, upperCI=hi.nor, FCI=F)
##D set.seed(seed)
##D counts.aep4 <- gen.freq.curves(n, para, nsim=nsim,
##D                    asprob=TRUE, showparent=TRUE, col=rgb(0,0,1,0.025),
##D                    lowerCI=lo.aep4, upperCI=hi.aep4, FCI=F)
##D lines( c(qF,qF), c(lo.nor, hi.nor),  lwd=2, col=2)
##D points(c(qF,qF), c(lo.nor, hi.nor),  pch=1, lwd=2, col=2)
##D lines( c(qF,qF), c(lo.aep4,hi.aep4), lwd=2, col=2)
##D points(c(qF,qF), c(lo.aep4,hi.aep4), pch=2, lwd=2, col=2)
##D percent.nor  <- (counts.nor$count.above.upperCI +
##D                  counts.nor$count.below.lowerCI) /
##D                  counts.nor$count.valid.simulations
##D percent.aep4 <- (counts.aep4$count.above.upperCI +
##D                  counts.aep4$count.below.lowerCI) /
##D                  counts.aep4$count.valid.simulations
##D percent.nor  <- 100 * percent.nor
##D percent.aep4 <- 100 * percent.aep4
##D message("NORMAL ERROR DIST: ",percent.nor)
##D message("  AEP4 ERROR DIST: ",percent.aep4)
##D # Continuing on, we are strictly focused on F being equal to 0.99
##D # Also we are no restricted to the example using the GEV distribution
##D # The vargev() function is from Handbook of Hydrology
##D "vargev" <-
##D function(para, n, F=c("F080", "F090", "F095", "F099", "F998", "F999")) {
##D    F <- as.character(F)
##D    if(! are.pargev.valid(para)) return()
##D    F <- match.arg(F)
##D    A <- para$para[2]
##D    K <- para$para[3]
##D    AS <- list(F080=c(-1.813,  3.017, -1.4010, 0.854),
##D               F090=c(-2.667,  4.491, -2.2070, 1.802),
##D               F095=c(-3.222,  5.732, -2.3670, 2.512),
##D               F098=c(-3.756,  7.185, -2.3140, 4.075),
##D               F099=c(-4.147,  8.216, -0.2033, 4.780),
##D               F998=c(-5.336, 10.711, -1.1930, 5.300),
##D               F999=c(-5.943, 11.815, -0.6300, 6.262))
##D    AS <- as.environment(AS); CO <- get(F, AS)
##D    varx <- A^2 * exp( CO[1] + CO[2]*exp(-K) + CO[3]*K^2 + CO[4]*K^3 ) / n
##D    names(varx) <- NULL
##D    return(varx)
##D }
##D sdx <- sqrt(vargev(para, n, F="F099"))
##D VAL  <- qlmomco(F, para)
##D lo.vargev <- VAL + qt(0.05, df=n) * sdx # minus covered by return of qt()
##D hi.vargev <- VAL + qt(0.95, df=n) * sdx
##D 
##D set.seed(seed)
##D counts.vargev <- gen.freq.curves(n, para, nsim=nsim,
##D                    xlim=c(0,3), ylim=c(3,15),
##D                    asprob=TRUE, showparent=TRUE, col=rgb(0,0,1,0.01),
##D                    lowerCI=lo.vargev, upperCI=hi.vargev, FCI=F)
##D percent.vargev  <- (counts.vargev$count.above.upperCI +
##D                     counts.vargev$count.below.lowerCI) /
##D                     counts.vargev$count.valid.simulations
##D percent.vargev  <- 100 * percent.vargev
##D lines(c(qF,qF),  range(c(lo.nor,   hi.nor,
##D                          lo.aep4,  hi.aep4,
##D                          lo.vargev,hi.vargev)), col=2)
##D points(c(qF,qF), c(lo.nor,      hi.nor), pch=1, lwd=2, col=2)
##D points(c(qF,qF), c(lo.aep4,    hi.aep4), pch=3, lwd=2, col=2)
##D points(c(qF,qF), c(lo.vargev,hi.vargev), pch=2, lwd=2, col=2)
##D message("NORMAL ERROR DIST: ",percent.nor)
##D message("  AEP4 ERROR DIST: ",percent.aep4)
##D message("VARGEV ERROR DIST: ",percent.vargev)
## End(Not run)



