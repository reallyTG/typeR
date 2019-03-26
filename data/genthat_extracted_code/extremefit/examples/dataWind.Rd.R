library(extremefit)


### Name: dataWind
### Title: Wind speed for Brest (France)
### Aliases: dataWind

### ** Examples


library(extremefit)
data("dataWind")
attach(dataWind)

pred <- NULL
for(m in 1:12){
  indices <- which(Month == m)
  X <- Speed[indices]*60*60/1000
  H <- hill.adapt(X)
  pred[m] <- predict(H, newdata = 100, type = "survival")$y
}
plot(pred, ylab = "Estimated survival probability", xlab = "Month")




