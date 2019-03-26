library(KFAS)


### Name: predict.SSModel
### Title: State Space Model Predictions
### Aliases: predict.SSModel predict

### ** Examples


set.seed(1)
x <- runif(n=100,min=1,max=3)
y <- rpois(n=100,lambda=exp(x-1))
model <- SSModel(y~x,distribution="poisson")
xnew <- seq(0.5,3.5,by=0.1)
newdata <- SSModel(rep(NA,length(xnew))~xnew,distribution="poisson")
pred <- predict(model,newdata=newdata,interval="prediction",level=0.9,nsim=100)
plot(x=x,y=y,pch=19,ylim=c(0,25),xlim=c(0.5,3.5))
matlines(x=xnew,y=pred,col=c(2,2,2),lty=c(1,2,2),type="l")

model <- SSModel(Nile~SSMtrend(1,Q=1469),H=15099)
pred <- predict(model,n.ahead=10,interval="prediction",level=0.9)
pred



