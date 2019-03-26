library(dlnm)


### Name: poly
### Title: Generate a Basis Matrix of Polynomials
### Aliases: poly
### Keywords: smooth

### ** Examples

### simple use (accessing non-exported function through ':::')
dlnm:::poly(1:5, degree=3)
dlnm:::poly(1:5, degree=3, intercept=TRUE)

### use as an internal function in onebasis
b <- onebasis(chicagoNMMAPS$pm10, "poly", degree=3)
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")



