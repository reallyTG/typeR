library(CEGO)


### Name: modelLinear
### Title: Distance based Linear Model
### Aliases: modelLinear

### ** Examples

#set random number generator seed
set.seed(1)
#simple test landscape
fn <- landscapeGeneratorUNI(1:5,distancePermutationHamming)
#generate data for training and test
x <- unique(replicate(40,sample(5),FALSE))
xtest <- x[-(1:15)]
x <- x[1:15]
#determin true objective function values
y <- fn(x)
ytest <- fn(xtest)
#build model
fit <- modelLinear(x,y,distancePermutationHamming)
#predicted obj. function values
ypred <- predict(fit,xtest)$y
#plot
plot(ytest,ypred,xlab="true value",ylab="predicted value",
    pch=20,xlim=c(0.3,1),ylim=c(min(ypred)-0.1,max(ypred)+0.1))
abline(0,1,lty=2)



