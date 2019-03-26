library(AIM)


### Name: logistic.interaction
### Title: Interaction logistic adaptive index model
### Aliases: logistic.interaction

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

## fit the interaction logistic AIM
a=logistic.interaction(x, trt, y, nsteps=10)
 
## examine the model sequence 
print(a)

## compute the index based on the 2nd model of the sequence using data x 
z.prd=index.prediction(a$res[[2]],x)

## compute the index based on the 2nd model of the sequence using new data xx, and compare the result with the true index
nn=10
xx=matrix(rnorm(nn*p), nn, p)
zz=(xx[,1]<0.2)+(xx[,5]>0.2)
zz.prd=index.prediction(a$res[[2]],xx) 
cbind(zz, zz.prd)



