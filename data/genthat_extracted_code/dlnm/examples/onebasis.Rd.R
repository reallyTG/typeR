library(dlnm)


### Name: onebasis
### Title: Generate a Basis Matrix for Different Functions
### Aliases: onebasis summary.onebasis mkbasis mklagbasis
### Keywords: smooth

### ** Examples

### a polynomial transformation of a simple vector
onebasis(1:5, "poly", degree=3)

### a low linear threshold parameterization, with and without intercept
onebasis(1:5, "thr", thr=3, side="l")
onebasis(1:5, "thr", thr=3, side="l", intercept=TRUE)

### relationship between PM10 and mortality estimated by a step function
b <- onebasis(chicagoNMMAPS$pm10, "strata", breaks=c(20,40))
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")

### changing the reference in prediction (alternative to argument ref in strata)
pred <- crosspred(b, model, cen=30, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10, alternative reference")

### relationship between temperature and mortality: double threshold
b <- onebasis(chicagoNMMAPS$temp, "thr", thr=c(10,25))
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, by=1)
plot(pred, xlab="Temperature (C)", ylab="RR", main="RR for temperature")

### extending the example for the 'ns' function in package splines
b <- onebasis(women$height, df=5)
summary(b)
model <- lm(weight ~ b, data=women)
pred <- crosspred(b, model, cen=65)
plot(pred, xlab="Height (in)", ylab="Weight (lb) difference",
  main="Association between weight and height")
  
### use with a user-defined function with proper attributes
mylog <- function(x, scale=min(x, na.rm=TRUE)) {
  basis <- log(x-scale+1)
  attributes(basis)$scale <- scale
  return(basis)
}
mylog(-2:5)
onebasis(-2:5,"mylog")



