library(fda)


### Name: cor.fd
### Title: Correlation matrix from functional data object(s)
### Aliases: cor.fd
### Keywords: smooth

### ** Examples

daybasis3 <- create.fourier.basis(c(0, 365))
daybasis5 <- create.fourier.basis(c(0, 365), 5)
tempfd3 <- with(CanadianWeather, smooth.basis(
       day.5, dailyAv[,,"Temperature.C"], 
       daybasis3, fdnames=list("Day", "Station", "Deg C"))$fd )
precfd5 <- with(CanadianWeather, smooth.basis(
       day.5, dailyAv[,,"log10precip"], 
       daybasis5, fdnames=list("Day", "Station", "Deg C"))$fd )

# Correlation matrix for a single functional data object
(tempCor3 <- cor.fd(seq(0, 356, length=4), tempfd3))

# Cross correlation matrix between two functional data objects 
# Compare with structure described above under 'value':
(tempPrecCor3.5 <- cor.fd(seq(0, 365, length=4), tempfd3,
                          seq(0, 356, length=6), precfd5))

# The following produces contour and perspective plots

daybasis65 <- create.fourier.basis(rangeval=c(0, 365), nbasis=65)
daytempfd <- with(CanadianWeather, smooth.basis(
       day.5, dailyAv[,,"Temperature.C"], 
       daybasis65, fdnames=list("Day", "Station", "Deg C"))$fd )
dayprecfd <- with(CanadianWeather, smooth.basis(
       day.5, dailyAv[,,"log10precip"], 
       daybasis65, fdnames=list("Day", "Station", "log10(mm)"))$fd )

str(tempPrecCor <- cor.fd(weeks, daytempfd, weeks, dayprecfd))
# dim(tempPrecCor)= c(53, 53)

op <- par(mfrow=c(1,2), pty="s")
contour(weeks, weeks, tempPrecCor, 
        xlab="Average Daily Temperature",
        ylab="Average Daily log10(precipitation)",
        main=paste("Correlation function across locations\n",
          "for Canadian Anual Temperature Cycle"),
        cex.main=0.8, axes=FALSE)
axisIntervals(1, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
axisIntervals(2, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
persp(weeks, weeks, tempPrecCor,
      xlab="Days", ylab="Days", zlab="Correlation")
mtext("Temperature-Precipitation Correlations", line=-4, outer=TRUE)
par(op)

# Correlations and cross correlations
# in a bivariate functional data object
gaitbasis5 <- create.fourier.basis(nbasis=5)
gaitfd5 <- Data2fd(gait, basisobj=gaitbasis5)

gait.t3 <- (0:2)/2
(gaitCor3.5 <- cor.fd(gait.t3, gaitfd5))
# Check the answers with manual computations
gait3.5 <- eval.fd(gait.t3, gaitfd5)
all.equal(cor(t(gait3.5[,,1])), gaitCor3.5[,,,1])
# TRUE
all.equal(cor(t(gait3.5[,,2])), gaitCor3.5[,,,3])
# TRUE
all.equal(cor(t(gait3.5[,,2]), t(gait3.5[,,1])),
               gaitCor3.5[,,,2])
# TRUE

# NOTE:
dimnames(gaitCor3.5)[[4]]
# [1] Hip-Hip
# [2] Knee-Hip 
# [3] Knee-Knee
# If [2] were "Hip-Knee", then
# gaitCor3.5[,,,2] would match 
# cor(t(gait3.5[,,1]), t(gait3.5[,,2]))
# *** It does NOT.  Instead, it matches:  
# cor(t(gait3.5[,,2]), t(gait3.5[,,1]))




