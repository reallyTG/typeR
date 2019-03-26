library(crrSC)


### Name: psh.test
### Title: Goodness-of-fit test for proportional subdistribution hazards
###   model
### Aliases: psh.test

### ** Examples

data(bce)
attach(bce)
lognodes <- log(nnodes)
Z1 <- cbind(lognodes, tsize/10, age, trt)  
# trt = 0 if placebo, = 0 treatment
# testing for linear time varying effect of trt
psh.test(time=time, fstatus=type, z=Z1, D=c(0,0,0,1), tf=function(x) x)
# testing for quadratic time varying effect of trt
psh.test(time=time, fstatus=type, z=Z1, D=c(0,0,0,1), tf=function(x) x^2)
# testing for log time varying effect of trt
psh.test(time=time, fstatus=type, z=Z1, D=c(0,0,0,1), 
tf=function(x) log(x))
# testing for both linear and quadratic time varying effect of trt
psh.test(time=time, fstatus=type, z=Z1, 
D=matrix(c(0,0,0,1,0,0,0,1), 4,2),  tf=function(x) cbind(x,x^2))




