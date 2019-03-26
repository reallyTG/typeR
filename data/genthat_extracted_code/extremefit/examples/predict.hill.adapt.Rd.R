library(extremefit)


### Name: predict.hill.adapt
### Title: Predict the adaptive survival or quantile function
### Aliases: predict.hill.adapt

### ** Examples

x <- rparetoCP(1000)

HH <- hill.adapt(x, weights=rep(1, length(x)), initprop = 0.1,
               gridlen = 100 , r1 = 0.25, r2 = 0.05, CritVal=10)

newdata <- probgrid(p1 = 0.01, p2 = 0.999, length = 100)
pred.quantile <- predict(HH, newdata, type = "quantile")
newdata <- seq(0, 50, 0.1)
pred.survival <- predict(HH, newdata, type = "survival")#survival function

#compare the theorical quantile and the adaptive one.
predict(HH, 0.9999, type = "quantile")
qparetoCP(0.9999)

#compare the theorical probability and the adaptive one assiociated to a quantile.
predict(HH, 20, type = "survival")
1 - pparetoCP(20)




