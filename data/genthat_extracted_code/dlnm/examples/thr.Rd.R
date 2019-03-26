library(dlnm)


### Name: thr
### Title: Generate a Basis Matrix of Linear Threshold Transformations
### Aliases: thr
### Keywords: smooth

### ** Examples

### simple use (accessing non-exported function through ':::')
dlnm:::thr(1:5, thr=3)
dlnm:::thr(1:5, side="d")
dlnm:::thr(1:5, side="d", intercept=TRUE)

### use as an internal function in onebasis
b <- onebasis(chicagoNMMAPS$pm10, "thr", thr.value=20)
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")



