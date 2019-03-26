library(MPV)


### Name: p2.14
### Title: Data Set for Problem 2-14
### Aliases: p2.14
### Keywords: datasets

### ** Examples

data(p2.14)
attach(p2.14)
plot(p2.14, pch=16, ylim=c(0,1))
visc.lm <- lm(visc ~ ratio)
summary(visc.lm)
visc.conf <- predict(visc.lm, interval="confidence")
lines(ratio, visc.conf[,2], col="red")
lines(ratio, visc.conf[,3], col="red")
visc.pred <- predict(visc.lm, interval="prediction")
lines(ratio, visc.pred[,2], col="blue")
lines(ratio, visc.pred[,3], col="blue")
detach(p2.14)



