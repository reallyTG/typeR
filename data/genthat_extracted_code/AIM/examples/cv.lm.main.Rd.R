library(AIM)


### Name: cv.lm.main
### Title: Cross-validation in main effect linear AIM
### Aliases: cv.lm.main

### ** Examples

## generate data
set.seed(1)

n=400
p=10
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
beta=1
y=beta*z+rnorm(n)


## cross-validate the linear main effects AIM
a=cv.lm.main(x, y,  nsteps=10, K.cv=5, num.replicate=3)
 
## examine score test statistics in the test set 
par(mfrow=c(1,2))
plot(a$meanscore, type="l")
plot(a$pvfit.score, type="l")


## construct the index with the optimal number of binary rules 
k.opt=a$kmax
a=lm.main(x, y, nsteps=k.opt)
print(a)



