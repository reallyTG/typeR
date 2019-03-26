library(DSpat)


### Name: dspat
### Title: Fits spatial model to distance sampling data
### Aliases: dspat

### ** Examples


# get example data
data(DSpat.lines)
data(DSpat.obs)
data(DSpat.covariates)
# Fit model with covariates used to create the data
sim.dspat=dspat(~ river + factor(habitat),
                study.area=owin(xrange=c(0,100), yrange=c(0,100)),
                obs=DSpat.obs,lines=DSpat.lines,covariates=DSpat.covariates,
                epsvu=c(4,.1),width=0.4)
## No test: 
# Print
sim.dspat
# Summarize results
summary(sim.dspat)
# Extract coefficients
coef.intensity <- coef(sim.dspat)$intensity
coef.detection <- coef(sim.dspat)$detection
# Extract variance-covariance matrix (inverse information matrix)
J.inv <- vcov(sim.dspat)
# Compute AIC
AIC(sim.dspat)
# Visualize intensity (no. animals per area) and estimate abundance
mu.B <- integrate.intensity(sim.dspat,dimyx=100)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
dev.new()
plot(mu.B$lambda, col=gray(1-c(1:100)/120), main='Estimated Intensity')
plot(sim.dspat$model$Q$data,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$lines.psp,lty=2,add=TRUE)

# Compute se and confidence interval for abundance without over-dispersion
mu.B <- integrate.intensity(sim.dspat,se=TRUE,dimyx=100)
cat("Standard Error =  ", round(mu.B$precision$se,0), "\n",
    "95 Percent Conf. Int. =   (", round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ")", "\n")
# Compute se and confidence interval for abundance with over-dispersion estimate
dev.new()
# The rest of the example has been put into a function to speed up package checking; remove # to run
# to run type do.dspat()
do.spat=function()
{
mu.B <- integrate.intensity(sim.dspat,se=TRUE,od=TRUE,reps=30,dimyx=100)
cat("Standard Error (corrected) =     ", round(mu.B$precision.od$se,0), "\n",
    "95 Percent Conf. Int. (corrected) =      (", round(mu.B$precision.od$lcl.95,0),
              ",", round(mu.B$precision.od$ucl.95,0), ")", "\n")
# Fit model with smooth of x and y
sim.dspat=dspat(~ s(x) + s(y),study.area=owin(xrange=c(0,100), yrange=c(0,100)),
                obs=DSpat.obs,lines=DSpat.lines,covariates=DSpat.covariates,
                epsvu=c(1,.01),width=0.4)
AIC(sim.dspat)
# Visualize intensity (no. animals per area) and estimate abundance
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat("Standard Error =     ", round(mu.B$precision$se,0), "\n",
    "95 Percent Conf. Int. =      (", round(mu.B$precision$lcl.95,0),
              ",", round(mu.B$precision$ucl.95,0), ")", "\n")
dev.new()
plot(mu.B$lambda, col=gray(1-c(1:100)/120), main='Estimated Intensity')
plot(sim.dspat$model$Q$data,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
#
# Fit model with smooth of x and y with interaction
#
sim.dspat=dspat(~ s(x,y),study.area=owin(xrange=c(0,100), yrange=c(0,100)),
                obs=DSpat.obs,lines=DSpat.lines,covariates=DSpat.covariates,
                epsvu=c(1,.01),width=0.4)
AIC(sim.dspat)
# Visualize intensity (no. animals per area) and estimate abundance
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat("Standard Error =     ", round(mu.B$precision$se,0), "\n",
    "95 Percent Conf. Int. =      (", round(mu.B$precision$lcl.95,0),
              ",", round(mu.B$precision$ucl.95,0), ")", "\n")
dev.new()
plot(mu.B$lambda, col=gray(1-c(1:100)/120), main='Estimated Intensity')
plot(sim.dspat$model$Q$data,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
}
## End(No test)



