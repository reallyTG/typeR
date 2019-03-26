library(dlnm)


### Name: strata
### Title: Generate a Basis Matrix of Indicator Variables
### Aliases: strata
### Keywords: smooth

### ** Examples

### simple use (accessing non-exported function through ':::')
dlnm:::strata(1:5, breaks=3)
dlnm:::strata(1:5, df=3)
dlnm:::strata(1:5, df=3, intercept=TRUE)
dlnm:::strata(1:5, df=3, ref=2, intercept=TRUE)

### use as an internal function in onebasis
b <- onebasis(chicagoNMMAPS$pm10, "strata", breaks=c(20,40))
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")



