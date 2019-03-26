library(acp)


### Name: acp
### Title: Autoregressive Conditional Poisson (ACP) Regression
### Aliases: acp acp.default acp.formula print.acp predict.acp summary.acp
###   print.summary.acp
### Keywords: regression

### ** Examples


data(polio)

trend=(1:168/168)
cos12=cos((2*pi*(1:168))/12)
sin12=sin((2*pi*(1:168))/12)
cos6=cos((2*pi*(1:168))/6)
sin6=sin((2*pi*(1:168))/6)


#Autoregressive Conditional Poisson Model with explaning covariates
polio_data<-data.frame(polio, trend , cos12, sin12, cos6, sin6)
mod1 <- acp(polio~-1+trend+cos12+sin12+cos6+sin6,data=polio_data, p = 1 ,q = 2)
summary(mod1)

#Static out-of-sample fit example
train<-data.frame(polio_data[c(1: 119),])
mod1t <- acp(polio~-1+trend+cos12+sin12+cos6+sin6,data=train, p = 1  ,q = 2)
xpolio_data<-data.frame(trend , cos12, sin12, cos6, sin6)
test<-xpolio_data[c(120:nrow(xpolio_data)),]
yfor<-polio_data[120:nrow(polio_data),1]
predict(mod1t,yfor,test)

#Autoregressive Conditional Poisson Model without explaning covariates
polio_data<-data.frame(polio)
mod2 <- acp(polio~-1,data=polio_data, p = 3 ,q = 1)
summary(mod2)

#Poisson Model with explaning covariates
polio_data<-data.frame(polio, trend , cos12, sin12, cos6, sin6)
mod3 <- acp(polio~trend+cos12+sin12+cos6+sin6,data=polio_data,family="poisson")
summary(mod3)

#Default method for ACP regression
X<-cbind(trend , cos12, sin12, cos6, sin6)
mod4<-acp(X,polio,3,1,startval=NULL,varopt=TRUE)
print(mod4)
summary(mod4)
residuals(mod4)
mod4$vcov
mod4$AIC
mod4$BIC



