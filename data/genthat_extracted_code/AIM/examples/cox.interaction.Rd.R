library(AIM)


### Name: cox.interaction
### Title: Interaction Cox adaptive index model
### Aliases: cox.interaction

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


## fit the interaction Cox AIM model 
a=cox.interaction(x, trt, y, delta, nsteps=10)
 
## examine the model sequence 
print(a)

## compute the index based on the 2nd model in the sequence using data x 
z.prd=index.prediction(a$res[[2]],x)

## compute the index based on the 2nd model of the sequence using new data xx, and compare the result with the true index
nn=10
xx=matrix(rnorm(nn*p), nn, p)
zz=(xx[,1]<0.2)+(xx[,5]>0.2)
zz.prd=index.prediction(a$res[[2]],xx) 
cbind(zz, zz.prd)



