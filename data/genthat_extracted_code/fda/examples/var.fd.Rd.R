library(fda)


### Name: var.fd
### Title: Variance, Covariance, and Correlation Surfaces for Functional
###   Data Object(s)
### Aliases: var.fd
### Keywords: smooth

### ** Examples

##
## Example with 2 different bases 
##
daybasis3 <- create.fourier.basis(c(0, 365))
daybasis5 <- create.fourier.basis(c(0, 365), 5)
tempfd3 <- with(CanadianWeather, smooth.basis(day.5, 
       dailyAv[,,"Temperature.C"], 
       daybasis3, fdnames=list("Day", "Station", "Deg C"))$fd )
precfd5 <- with(CanadianWeather, smooth.basis(day.5, 
       dailyAv[,,"log10precip"],
       daybasis5, fdnames=list("Day", "Station", "Deg C"))$fd )

# Compare with structure described above under 'value':
str(tempPrecVar3.5 <- var.fd(tempfd3, precfd5))

##
## Example with 2 variables, same bases
##
gaitbasis3 <- create.fourier.basis(nbasis=3)
str(gaitfd3 <- Data2fd(gait, basisobj=gaitbasis3))
str(gaitVar.fd3 <- var.fd(gaitfd3))


# Check the answers with manual computations 
all.equal(var(t(gaitfd3$coefs[,,1])), gaitVar.fd3$coefs[,,,1])
# TRUE
all.equal(var(t(gaitfd3$coefs[,,2])), gaitVar.fd3$coefs[,,,3])
# TRUE
all.equal(var(t(gaitfd3$coefs[,,2]), t(gaitfd3$coefs[,,1])),
          gaitVar.fd3$coefs[,,,2])
# TRUE

# NOTE:
dimnames(gaitVar.fd3$coefs)[[4]]
# [1] Hip-Hip
# [2] Knee-Hip 
# [3] Knee-Knee
# If [2] were "Hip-Knee", then
# gaitVar.fd3$coefs[,,,2] would match 
#var(t(gaitfd3$coefs[,,1]), t(gaitfd3$coefs[,,2]))
# *** It does NOT.  Instead, it matches:  
#var(t(gaitfd3$coefs[,,2]), t(gaitfd3$coefs[,,1])),

##
## The following produces contour and perspective plots
##
# Evaluate at a 53 by 53 grid for plotting

daybasis65 <- create.fourier.basis(rangeval=c(0, 365), nbasis=65)

daytempfd <- with(CanadianWeather, smooth.basis(day.5, 
       dailyAv[,,"Temperature.C"],
       daybasis65, fdnames=list("Day", "Station", "Deg C"))$fd )
str(tempvarbifd <- var.fd(daytempfd))

str(tempvarmat  <- eval.bifd(weeks,weeks,tempvarbifd))
# dim(tempvarmat)= c(53, 53)

op <- par(mfrow=c(1,2), pty="s")
#contour(tempvarmat, xlab="Days", ylab="Days")
contour(weeks, weeks, tempvarmat, 
        xlab="Daily Average Temperature",
        ylab="Daily Average Temperature",
        main=paste("Variance function across locations\n",
          "for Canadian Anual Temperature Cycle"),
        cex.main=0.8, axes=FALSE)
axisIntervals(1, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
axisIntervals(2, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
persp(weeks, weeks, tempvarmat,
      xlab="Days", ylab="Days", zlab="Covariance")
mtext("Temperature Covariance", line=-4, outer=TRUE)
par(op)




