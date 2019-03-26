library(berryFunctions)


### Name: lsc
### Title: Linear storage cascade, unit hydrograph
### Aliases: lsc
### Keywords: hplot optimize ts

### ** Examples


qpfile <- system.file("extdata/Q_P.txt", package="berryFunctions")
qp <- read.table(qpfile, sep="\t", dec=",", header=TRUE)
calib <- qp[1:90,]
valid <- qp[-(1:90),]

# Area can be estimated from runoff coefficient (proportion of N becoming Q):
#    k*P * A = Q * t      A = Qt / kP
# Q=0.25 m^3/s  * t=89 h   *  3600 s/h   k=psi* P =34mm = 0.034m = m^3/m^2
#                                                      / 1e6 m^2/km^2   = km^2
mean(calib$Q) * length(calib$Q) *3600  / ( 0.7 * sum(calib$P)/1000) / 1e6
# 3.368 km^2


# calibrate Unit Hydrograph:
UHcalib <- lsc(calib$P, calib$Q, area=3.4)
UHcalib # n 0.41  k 244.9  NSE 0.74  psi 0.45
# Psi is lower than 0.7, as it is now calculated on direct runoff only

# Corresponding Unit Hydrograph:
UH <- unitHydrograph(n=UHcalib["n"], k=UHcalib["k"], t=1:length(calib$P))
plot(UH, type="l") # That's weird anyways...
sum(UH) # 0.58 - we need to look at a longer time frame

# calibrate Unit Hydrograph on peak only:
lsc(calib$P, calib$Q, area=3.4, fit=17:40) # n 0.63  k  95.7  NSE 0.67
# for fit, use index numbers, not x-axis units (if you have specified x)

# Simulated discharge instead of parameters:
lsc(calib$P, calib$Q, area=3.4, returnsim=TRUE, plot=FALSE)


## Not run: 
##D ## Time consuming tests excluded from CRAN checks
##D 
##D # Apply this to the validation event
##D dummy <- lsc(valid$P, valid$Q, area=3.4, plotsim=FALSE, type="l")
##D Qsim <- superPos(valid$P, UH)
##D Qsim <- Qsim + valid$Q[1] # add baseflow
##D lines(Qsim, lwd=2, xpd=NA)
##D legend("center", legend=c("Observed","Simulated from calibration"),
##D        lwd=c(1,2), col=c(2,1) )
##D nse(valid$Q, Qsim[1:nrow(valid)]) # 0.47, which is not really good.
##D # performs OK for the first event, but misses the peak from the second.
##D # this particular UH is apparently not suitable for high pre-event soil moisture.
##D # Along with longer events, UH properties may change!!!
##D dummy # in-sample NSE 0.75 is a lot better
##D 
##D # Now for the second peak in the validation dataset:
##D lsc(valid$P, valid$Q, type="l", area=3.4, fit=60:90) # overestimates first peak
##D # Area cannot be right - is supposedly 17 km^2.
##D 
##D # Different starting points for optim:
##D lsc(calib$P, calib$Q, area=3.4, n= 2  , k=  3, plot=FALSE) # Default
##D lsc(calib$P, calib$Q, area=3.4, n= 5  , k= 20, plot=FALSE) # same result
##D lsc(calib$P, calib$Q, area=3.4, n=10  , k= 20, plot=FALSE) # ditto
##D lsc(calib$P, calib$Q, area=3.4, n=10  , k=  3, plot=FALSE) # ditto
##D lsc(calib$P, calib$Q, area=3.4, n= 1.9, k=900, plot=FALSE) # ditto
##D lsc(calib$P, calib$Q, area=3.4, n=50  , k= 20) # nonsense
##D # the catchment is small, so n must be low.
##D 
##D 
##D #sensitivity against area uncertainty:
##D Asens <- data.frame(A=seq(1,15,0.5),
##D     t(sapply(seq(1,15,0.5), function(A) lsc(calib$P, calib$Q, area=A, plot=FALSE))))
##D Asens
##D plot(Asens$A, Asens$NSE, type="l", ylim=c(-0.3,2), las=1, main="lsc depends on area")
##D abline(v=3.4, lty=2)
##D lines(Asens$A, Asens$n, col=2)
##D points(3.4, 2, col=2)
##D lines(Asens$A, Asens$psi, col=5)
##D text(rep(13,4),y=c(1.5, 0.8, 0.4,0), c("k ->","<- NSE","<- n","<- psi"), col=c(4,1,2,5))
##D par(new=TRUE); plot(Asens$A, Asens$k, type="l", ann=FALSE, axes=FALSE, col=4)
##D axis(4, col.axis=4)
##D points(3.4, 3, col=4)
##D 
##D # Autsch - that shouldn't happen!
##D # Still need to find out what to do with optim
##D 
##D 
##D lsc(calib$P, calib$Q, area=1.6) # not bad indeed
## End(Not run)




