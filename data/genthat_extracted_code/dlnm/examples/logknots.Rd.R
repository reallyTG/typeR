library(dlnm)


### Name: logknots
### Title: Define Knots for Lag Space at Equally-Spaced Log-Values
### Aliases: logknots
### Keywords: smooth

### ** Examples

### setting 3 knots for lag 0-20
logknots(20, 3)
logknots(c(0,20), 3)

### setting knots and cut-offs for different functions
logknots(20, fun="ns", df=4)
logknots(20, fun="bs", df=4, degree=2)
logknots(20, fun="strata", df=4)

### with and without without intercept
logknots(20, fun="ns", df=4)
logknots(20, fun="ns", df=4, intercept=FALSE)

### replicating an old example in time series analysis
lagknots <- logknots(30, 3)
cb <- crossbasis(chicagoNMMAPS$temp, lag=30, argvar=list(fun="bs",df=5,
  degree=2), arglag=list(knots=lagknots))
summary(cb)
library(splines)
model <- glm(death ~  cb + ns(time, 7*14) + dow, 
  family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(cb, model, cen=21, by=1)
plot(pred, xlab="Temperature", col="red", zlab="RR", shade=0.6,
  main="3D graph of temperature effect")



