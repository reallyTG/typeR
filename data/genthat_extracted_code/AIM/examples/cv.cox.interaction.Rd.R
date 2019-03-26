library(AIM)


### Name: cv.cox.interaction
### Title: Cross-validation in the interaction Cox AIM
### Aliases: cv.cox.interaction

### ** Examples

## generate data
set.seed(1)

n=400
p=10
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
beta=1
trt=rbinom(n,1,0.5)
fail.time=rexp(n)*exp(-beta*z*trt)
cen.time=rexp(n)*1.25
y=pmin(fail.time, cen.time)
y=round(y*10)/10
delta=1*(fail.time<cen.time)



## cross-validate the interaction Cox AIM model 
a=cv.cox.interaction(x, trt, y, delta, nsteps=10, K.cv=4, num.replicate=5)
 
## examine the score test statistics for the interaction in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")

## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=cox.interaction(x, trt, y, delta, nsteps=k.opt)
print(a)



