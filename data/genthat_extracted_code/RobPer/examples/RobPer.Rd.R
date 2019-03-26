library(RobPer)


### Name: RobPer
### Title: Periodogram based on (robustly) fitting a periodic function to a
###   light curve
### Aliases: RobPer

### ** Examples

# For more examples see RobPer-package and TK95_uneq!

# Example to show the equivalence between the periodogram from Fourier analysis
# and the Lomb-Scargle periodogram in case of equidistant sampling and equal weighting:
set.seed(7)
n <- 120
# equidistant time series:
zr <- tsgen(ttype="equi", ytype="const", pf=1, redpart= 0, s.outlier.fraction=0.2, 
    interval=FALSE, npoints=n, ncycles=n, ps=1, SNR=1, alpha=1.5)
# periodogram of Fourier analysis
PP_konv <- spec.pgram(zr[,2], taper = 0,pad = 0, fast = FALSE, demean = TRUE,
    detrend = TRUE, plot = TRUE)
# Lomb-Scargle periodogram - Note: Due to the regression ansatz,
# RobPer is not able to compute period 2 in this case.
PP_new <- RobPer(ts=zr, weighting=FALSE, periods=1/PP_konv$freq,
    regression="L2", model="sine")
plot(PP_konv$freq, PP_konv$spec, ylab="periodogram", xlab="frequency",
    main="Comparison of RobPer(...regression='LS', model='sine') and spec.pgram")
points(PP_konv$freq, PP_new*var(zr[,2])*n/2, type="l")
legend("top",lty=c(1,0), pch=c(-5,1), legend=c("RobPer*var(y)*n/2", "spec.pgram"))
# Due to different ways of computation, the scaled periodograms are not exactly
# identical, but show very similar behavior.



