library(AIM)


### Name: cv.lm.interaction
### Title: Cross-validation in interaction linear AIM
### Aliases: cv.lm.interaction

### ** Examples

## generate data
set.seed(1)

n=400
p=10
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
trt=rbinom(n, 1, 0.5)
beta=1
y=trt+beta*trt*z+rnorm(n)



## cross-validate the interaction linear AIM
a=cv.lm.interaction(x, trt, y, nsteps=10, K.cv=5, num.replicate=3)
 
## examine the score test statistics in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")


## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=lm.interaction(x, y, trt, nsteps=k.opt)
print(a)



