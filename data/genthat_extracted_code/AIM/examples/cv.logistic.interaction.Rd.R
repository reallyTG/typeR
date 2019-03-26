library(AIM)


### Name: cv.logistic.interaction
### Title: Cross-validation in interaction logistic AIM
### Aliases: cv.logistic.interaction

### ** Examples

## generate data
set.seed(1)

n=400
p=10
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
trt=rbinom(n,1, 0.5)
beta=1
prb=1/(1+exp(trt-beta*trt*z-0.5))
y=rbinom(n,1,prb)


## cross-validate the logistic interaction AIM 
a=cv.logistic.interaction(x, trt, y, nsteps=10, K.cv=4, num.replicate=5)
 
## examine score test statistics in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")


## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=logistic.interaction(x, trt, y, nsteps=k.opt)
print(a)



