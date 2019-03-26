library(refund)


### Name: pwcv
### Title: Pointwise cross-validation for function-on-scalar regression
### Aliases: pwcv

### ** Examples


require(fda)
# Canadian weather example from Reiss et al. (2010).
# The first two lines are taken from the fRegress.CV help file (package fda)
smallbasis  <- create.fourier.basis(c(0, 365), 25)
tempfd <- smooth.basis(day.5,
          CanadianWeather$dailyAv[,,"Temperature.C"], smallbasis)$fd

# Model matrices for "latitude" and "region" models
Xreg = cbind(1, model.matrix(~factor(CanadianWeather$region)-1))
Xlat = model.matrix(~CanadianWeather$coord[,1])

# Fit each model using fosr() to obtain lambda values for pwcv()
Lreg = matrix(c(0,1,1,1,1), 1)   # constraint for region model
regionmod = fosr(fdobj=tempfd, X=Xreg, con=Lreg, method="OLS")
cv.region = pwcv(tempfd, Xreg, Lreg, regionmod$lambda)

latmod = fosr(fdobj=tempfd, X=Xlat, method="OLS")
cv.lat = pwcv(tempfd, Xlat, lambda=latmod$lambda)

# The following plots may require a wide graphics window to show up correctly
par(mfrow=1:2)
# Plot the functional data
plot(tempfd, col=1, lty=1, axes=list("axesIntervals"), xlab="", ylab="Mean temperature",
     main="Temperatures at 35 stations")
box()

# Plot the two models' pointwise CV
matplot(regionmod$argvals, cbind(cv.region, cv.lat), type='l', col=1, axes=FALSE,
        xlab="", ylab="MSE.CV", main="Pointwise CV for two models")
legend(250, 40, c('Region', 'Latitude'), lty=1:2)
box()
axis(2)
axisIntervals(1)



