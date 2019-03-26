library(forecast)


### Name: BoxCox
### Title: Box Cox Transformation
### Aliases: BoxCox InvBoxCox
### Keywords: ts

### ** Examples


lambda <- BoxCox.lambda(lynx)
lynx.fit <- ar(BoxCox(lynx,lambda))
plot(forecast(lynx.fit,h=20,lambda=lambda))




