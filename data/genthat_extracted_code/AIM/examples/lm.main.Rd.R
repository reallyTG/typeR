library(AIM)


### Name: lm.main
### Title: Main effect linear adaptive index model
### Aliases: lm.main

### ** Examples

## generate data
set.seed(1)

n=500
p=20
x=matrix(rnorm(n*p), n, p)
z=(x[,1]<0.2)+(x[,5]>0.2)
beta=1
y=beta*z+rnorm(n)


## fit the main effects linear AIM
a=lm.main(x, y, nsteps=10)
 
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



