library(BlakerCI)


### Name: binom.blaker.acc
### Title: Blaker's binomial acceptability function, optionally
###   unimodalized.
### Aliases: binom.blaker.acc
### Keywords: htest

### ** Examples

p <- seq(0,1,length=1001)
acc <- binom.blaker.acc(3,10,p)
acc1 <- binom.blaker.acc(3,10,p,type="unimod")
## The two functions look the same at first glance.
plot(p,acc,type="l")
lines(p,acc1,col="red")
legend(x=.7,y=.8,c("orig","unimod"),col=c("black","red"),lwd=1)

## There is, nevertheless, a difference.
plot(p,acc1-acc,type="l")

## Focussing on the difference about p=0.4:
p <- seq(.395,.405,length=1001)
acc <- binom.blaker.acc(3,10,p)
acc1 <- binom.blaker.acc(3,10,p,type="unimod")
plot(p,acc,type="l",ylim=c(.749,.7495))
lines(p,acc1,col="red")
legend(x=.402,y=.7494,c("orig","unimod"),col=c("black","red"),lwd=1)

## Difference between type="unimod" and mere applying
## cummax to values obtained via type="orig":
p <- seq(0,1,length=1001)
x <- 59
n <- 355
## Upper confidence limit (at 0.95 level) is slightly above 0.209:
binom.blaker.limits(x,n) ## [1] 0.1300807 0.2090809
## Unmodified acceptability value fall below 0.05 at p = .209
## left to the limit (so that the null hypothesis p = .209
## would be rejected despite the fact that p lies within
## the confidence interval):
acc <- binom.blaker.acc(59,355,p)
rbind(p,acc)[,207:211]
##           [,1]       [,2]       [,3]       [,4]       [,5]
## p   0.20600000 0.20700000 0.20800000 0.20900000 0.21000000
## acc 0.06606867 0.05759836 0.05014189 0.04999082 0.04330283
##
## Modified acceptability is above 0.05 at p = 0.05 (so that
## hypothesis p = 0.05 is not rejected by the modified test):
acc1 <- binom.blaker.acc(59,355,p,type="unimod")
rbind(p,acc1)[,207:211]
##            [,1]       [,2]       [,3]       [,4]       [,5]
## p    0.20600000 0.20700000 0.20800000 0.20900000 0.21000000
## acc1 0.06608755 0.05759836 0.05014189 0.05000009 0.04331409
##
## Applying cummax to unmodified acceptabilities guarantees unimodality 
## but lacks accuracy, leaving the value at p = 0.209 below 0.05:
m <- max(which(p <= 59/355))
acc2 <- acc
acc2[1:m] <- cummax(acc2[1:m])
acc2[1001:(m+1)] <- cummax(acc2[1001:(m+1)])
rbind(p,acc2)[,207:211]
##            [,1]       [,2]       [,3]       [,4]       [,5]
## p    0.20600000 0.20700000 0.20800000 0.20900000 0.21000000
## acc2 0.06606867 0.05759836 0.05014189 0.04999082 0.04330283




