library(TransModel)


### Name: predict.TransModel
### Title: Predict survival probabilities with confidence intervals and
###   confidence bands
### Aliases: predict.TransModel

### ** Examples

data(PH_examp)
mod1<-TransModel(formula=Surv(time,status)~gender+age,data=PH_examp,r=0)
# Predict survival probability
pred1<-predict(mod1,newdata=c(0,1))
pred2<-predict(mod1,newdata=c(1,1))
plot(pred1)
lines(pred2$time,pred2$survival,type="s",col=2)

### Not Run ###
# survival estimate with 95% pointwise CI and overall CB
# mod1<-TransModel(formula=Surv(time,status)~gender+age,data=PH_examp,r=0,CICB.st=TRUE,num.sim=50)
# pred1<-predict(mod1,newdata=c(0,1))
# plot(pred1,lty=1,col=1,CI=TRUE,CB=TRUE)
# Change the confidence level to 90%
# pred1<-predict(mod1,newdata=c(0,1),alpha=0.1)



