## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache=TRUE)
library(bamp)

## ----loadplot------------------------------------------------------------
data(apc)
plot(cases[,1],type="l",ylim=range(cases), ylab="cases", xlab="year", main="cases per age group")
for (i in 2:8)lines(cases[,i], col=i)

## ----Model1_with_RW1_priors----------------------------------------------
model1 <- bamp(cases, population, age="rw1", period="rw1", cohort="rw1",
              periods_per_agegroup = 5)

## ----check_model---------------------------------------------------------
checkConvergence(model1)

## ----print_model---------------------------------------------------------
print(model1)

## ----plot_model----------------------------------------------------------
plot(model1)

## ----plot_model_with_more_quantiles--------------------------------------
plot(model1, quantiles = c(0.025,0.1,0.5,0.9,0.975))

## ----prediction----------------------------------------------------------
pred <- predict_apc(object=model1, periods=3)

## ------------------------------------------------------------------------
m<-max(pred$pr[2,,])
plot(pred$pr[2,,8],type="l", ylab="probability", xlab="year", ylim=c(0,m))
for (i in 7:1)
  lines(pred$pr[2,,i],col=8-i)
legend(1,m,col=8:1,legend=paste("Age group",1:8),lwd=2,cex=0.6)
lines(c(10.5,10.5),c(0,1),lty=2)

