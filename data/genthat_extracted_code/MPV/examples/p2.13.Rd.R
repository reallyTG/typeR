library(MPV)


### Name: p2.13
### Title: Data Set for Problem 2-13
### Aliases: p2.13
### Keywords: datasets

### ** Examples

data(p2.13)
attach(p2.13)
plot(days~index, ylim=c(-20,130))
ozone.lm <- lm(days ~ index)
summary(ozone.lm)
# plots of confidence and prediction intervals:
ozone.conf <- predict(ozone.lm, interval="confidence")
lines(sort(index), ozone.conf[order(index),2], col="red")
lines(sort(index), ozone.conf[order(index),3], col="red")
ozone.pred <- predict(ozone.lm, interval="prediction")
lines(sort(index), ozone.pred[order(index),2], col="blue")
lines(sort(index), ozone.pred[order(index),3], col="blue")
detach(p2.13)



