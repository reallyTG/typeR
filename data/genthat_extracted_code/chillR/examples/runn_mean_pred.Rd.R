library(chillR)


### Name: runn_mean_pred
### Title: Prediction based on a running mean
### Aliases: runn_mean_pred
### Keywords: "running mean" prediction

### ** Examples


indep<-(1:100)
dep<-sin(indep/20)+rnorm(100)/5
pred<-c(12,13,51,70,90)

predicted<-runn_mean_pred(indep,dep,pred,runn_mean = 25)

plot(dep~indep)
points(predicted$predicted~predicted$x,col="red",pch=15)




