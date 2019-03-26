library(AIM)


### Name: cv.cox.main
### Title: Cross-validation in main effect Cox AIM
### Aliases: cv.cox.main

### ** Examples

## generate data

set.seed(1)

n=200
p=10
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
beta=1
fail.time=rexp(n)*exp(-beta*z)
cen.time=rexp(n)*1.25
y=pmin(fail.time, cen.time)
y=round(y*10)/10
delta=1*(fail.time<cen.time)


## cross-validate the main effect Cox AIM 
a=cv.cox.main(x, y, delta, nsteps=10, K.cv=3, num.replicate=3)
 

## examine the test statistics in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")


## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=cox.main(x, y, delta, nsteps=k.opt)
print(a)




