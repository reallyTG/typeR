library(dlnm)


### Name: lin
### Title: Generate a Basis Matrix with a Variable as Linear
### Aliases: lin
### Keywords: smooth

### ** Examples

### simple use (accessing non-exported function through ':::')
dlnm:::lin(1:5)
dlnm:::lin(1:5, intercept=TRUE)

### use as an internal function in onebasis (note the centering)
b <- onebasis(chicagoNMMAPS$pm10, "lin")
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")



