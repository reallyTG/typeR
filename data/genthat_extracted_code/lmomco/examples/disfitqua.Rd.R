library(lmomco)


### Name: disfitqua
### Title: Fit a Distribution using Minimization of Available Quantiles
### Aliases: disfitqua
### Keywords: distribution (parameters) quantile function percentiles,
###   method of

### ** Examples

# Suppose the following quantiles are estimated using eight equations provided by
# Asquith and Roussel (2009) for some watershed in Texas:
Q <- c(1480, 3230, 4670, 6750, 8700, 11000, 13600, 17500)
# These are real estimates from a suite of watershed properties but the watershed
# itself and location are not germane to demonstrate this function.
LQ <- log10(Q) # transform to logarithms of cubic feet per second
# Convert the averge annual return periods for the quantiles into probability
P <- T2prob(c(2, 5, 10, 25, 50, 100, 200, 500)); qP <- qnorm(P) # std norm variates
# The log-Pearson Type III (LPIII) is immensely popular for flood-risk computations.
# Let us compute LPIII parameters to the available quantiles and probabilities for
# the watershed. The log-Pearson Type III is "pe3" in the lmomco with logarithms.
par1 <- disfitqua(LQ, P, type="pe3", objfun="rmse") # root mean square error
par2 <- disfitqua(LQ, P, type="pe3", objfun="mad" ) # mean absolute deviation
# Now express the fitted distributions in forms of an LPIII.
LQfit1 <- qlmomco(P, par1); LQfit2 <- qlmomco(P, par2)

plot( qP, LQ, pch=5, xlab="STANDARD NORMAL VARIATES",
                     ylab="FLOOD QUANTILES, CUBIC FEET PER SECOND")
lines(qP, LQfit1, col=2); lines(qP, LQfit2, col=4) # red and blue lines
## Not run: 
##D # Now demonstrate how a Wakeby distribution can be fit. This is an example of how a
##D # three parameter distribution might be fit and then the general L-moments secured for
##D # an alternative fit using a far more complicated distribution. The Wakeby for the
##D # above situation does not fit "out of the box." The types "gld", "aep4", and "kap"
##D # all with four parameters work with some serious CPUs burned for gld.
##D lmr1 <- theoLmoms(par1) # need five L-moments but lmompe3() only gives four,
##D # therefore must compute the L-moment by numerical integration provided by theoLmoms().
##D par3 <- disfitqua(LQ, P, type="wak", objfun="rmse", init.lmr=lmr1)
##D lines(qP, par2qua(P, par3), col=6, lty=2) # dashed line, par2qua alternative to qlmomco
##D 
##D # Finally, the initial L-moment equivalents and then the L-moments of the fitted
##D # distribution can be computed and compared.
##D par2lmom(vec2par(par3$init.para, type="wak"))$ratios # initial L-moments
##D par2lmom(vec2par(par3$para,      type="wak"))$ratios # final L-moments
## End(Not run)



