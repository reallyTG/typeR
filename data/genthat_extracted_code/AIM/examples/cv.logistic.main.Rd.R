library(AIM)


### Name: cv.logistic.main
### Title: Cross-validation in the main effect logistic AIM
### Aliases: cv.logistic.main

### ** Examples

## generate data
set.seed(1)
n=500
p=20

x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
beta=1
prb=1/(1+exp(-beta*z))
y=rbinom(n,1,prb)


## cross-validate the logistic main effects AIM
a=cv.logistic.main(x, y, nsteps=10, K.cv=5, num.replicate=3)
 
## examine the score test statistics in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")


## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=logistic.main(x, y, nsteps=k.opt)
print(a)




