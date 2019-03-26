library(l2boost)


### Name: fitted.l2boost
### Title: Extract the fitted model estimates along the solution path for
###   an l2boost model.
### Aliases: fitted.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example: Diabetes 
#  
# See Efron B., Hastie T., Johnstone I., and Tibshirani R. 
# Least angle regression. Ann. Statist., 32:407-499, 2004.
data(diabetes, package="l2boost")

l2.object <- l2boost(diabetes$x,diabetes$y, M=1000, nu=.01)

# return the fitted values
fitted(l2.object)
fitted(l2.object, m=500)

#' # Create diagnostic plots
par(mfrow=c(2,2))
qqnorm(fitted(l2.object), ylim=c(0, 300))
qqline(fitted(l2.object), col=2)

qqnorm(fitted(l2.object, m=500), ylim=c(0, 300))
qqline(fitted(l2.object, m=500), col=2)

# Tukey-Anscombe's plot
plot(y=residuals(l2.object), x=fitted(l2.object), main="Tukey-Anscombe's plot",
  ylim=c(-3e-13, 3e-13))
lines(smooth.spline(fitted(l2.object), residuals(l2.object), df=4), type="l", 
  lty=2, col="red", lwd=2)
abline(h=0, lty=2, col = 'gray')

plot(y=residuals(l2.object, m=500), x=fitted(l2.object, m=500), 
  main="Tukey-Anscombe's plot", ylim=c(-3e-13, 3e-13))
lines(smooth.spline(fitted(l2.object,m=500), residuals(l2.object, m=500), df=4), 
  type="l", lty=2, col="red", lwd=2)
abline(h=0, lty=2, col = 'gray')




