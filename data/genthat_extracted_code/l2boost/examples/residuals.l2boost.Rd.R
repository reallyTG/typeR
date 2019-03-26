library(l2boost)


### Name: residuals.l2boost
### Title: Model residuals for the training set of an l2boost model object
### Aliases: residuals.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example: Diabetes 
#  
# For diabetes data set, see Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes, package = "l2boost")

l2.object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)
rsd<-residuals(l2.object)
rsd.mid <- residuals(l2.object, m=500)

# Create diagnostic plots
par(mfrow=c(2,2))
qqnorm(residuals(l2.object), ylim=c(-3e-13, 3e-13))
qqline(residuals(l2.object), col=2)

qqnorm(residuals(l2.object, m=500), ylim=c(-3e-13, 3e-13))
qqline(residuals(l2.object, m=500), col=2)

# Tukey-Anscombe's plot
plot(y=residuals(l2.object), x=fitted(l2.object), main="Tukey-Anscombe's plot",
   ylim=c(-3e-13, 3e-13))
lines(smooth.spline(fitted(l2.object), residuals(l2.object), df=4), type="l", 
  lty=2, col="red", lwd=2)
abline(h=0, lty=2, col = 'gray')

plot(y=residuals(l2.object, m=500), x=fitted(l2.object, m=500), main="Tukey-Anscombe's plot", 
  ylim=c(-3e-13, 3e-13))
lines(smooth.spline(fitted(l2.object,m=500), residuals(l2.object, m=500), df=4), type="l", 
  lty=2, col="red", lwd=2)
abline(h=0, lty=2, col = 'gray')





