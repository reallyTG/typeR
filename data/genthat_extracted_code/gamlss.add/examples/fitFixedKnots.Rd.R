library(gamlss.add)


### Name: fitFixedKnots
### Title: Functions to Fit Univariate Break Point Regression Models
### Aliases: fitFixedKnots fitFreeKnots
### Keywords: regression

### ** Examples

# creating  a linear + linear function
   x <- seq(0,10, length.out=201)
knot <- 5
 set.seed(12543)
 mu <- ifelse(x<=knot,5+0.5*x,5+0.5*x+(x-knot))
  y <- rNO(201, mu=mu, sigma=.5)
# plot the data
 plot(y~x, xlim=c(-1,13), ylim=c(3,18))

# fit model using fixed break points
 m1 <- fitFixedKnots(y, x, knots=5, degree=1)
knots(m1)
lines(fitted(m1)~x, col="red")

# now estimating the knot
m2 <- fitFreeKnots(y, x, knots=5, degree=1)
knots(m2)
summary(m2)

# now predicting 
plot(y~x, xlim=c(-5,13), ylim=c(3,18))
lines(fitted(m2)~x, col="green", lwd=3)
points(-2:13,predict(m2, newdata=-2:13), col="red",pch = 21, bg="blue")
points(-2:13,predict(m2, newdata=-2:13, old.x.range=FALSE), col="red",pch = 21, bg="grey")

# fit different basis 
m21 <- fitFreeKnots(y, x, knots=5, degree=1, base="Bbase")
deviance(m2) 
deviance(m21) # should be identical

# predicting with m21 
 plot(y~x, xlim=c(-5,13), ylim=c(3,18))
lines(fitted(m21)~x, col="green", lwd=3)
points(-2:13,predict(m21, newdata=-2:13), col="red",pch = 21, bg="blue")
points(-2:13,predict(m21, newdata=-2:13, old.x.range=FALSE), col="red",pch = 21, bg="grey")



