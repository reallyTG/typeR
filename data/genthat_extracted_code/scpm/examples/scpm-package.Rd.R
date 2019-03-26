library(scpm)


### Name: scpm-package
### Title: 'An R Package for Spatial Smoothing'
### Aliases: scpm-package scpm

### ** Examples

require(geoR)
data(landim1, package = "geoR")
d <- as.sss(landim1, coords = NULL, coords.col = 1:2, data.col = 3:4)
##fitting spatial linear model with response A and covariate B
##Gneiting covariance function in the errors
#m0 <- scp(A ~ linear(~ B), data = d, model = "RMgneiting")
##adding a bivariate cubic spline based on the coordinates
#m1 <- scp(A ~ linear(~ B) + s2D(penalty = "cs"), data = d, model = "RMgneiting")
##plotting observed and estimated field from each model
#par(mfrow=c(2,2))
#plot(m0, what = "obs", type = "persp", main = "Model null - y")
#plot(m0, what = "fit", type = "persp", main = "Model null - fit")
#plot(m1, what = "obs", type = "persp", main = "Model alternative - y")
#plot(m1, what = "fit", type = "persp", main = "Model alternative - fit")
##plotting the estimated semivariogram from each model
#par(mfrow=c(1,2))
#Variogram(m0,main="Semivariogram - model null", ylim = c(0,0.7))
#Variogram(m1,main="Semivariogram - model alternative", ylim = c(0,0.7))
##summary of the estimated coefficients
#summary(m0)
#summary(m1)
##some information criteria
#AIC(m0)
#AIC(m1)
#AICm(m0)
#AICm(m1)
#AICc(m0)
#AICc(m1)
#BIC(m0)
#BIC(m1)



