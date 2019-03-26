library(GPFDA)


### Name: mat2fd
### Title: Create an fd object from a matrix
### Aliases: mat2fd

### ** Examples

ry=rnorm(20,sd=10)
y1=matrix(0,ncol=100,nrow=20)
for(i in 1:20)  y1[i,]=sin(seq(-1,pi,len=100))*ry[i]

y1fd=mat2fd(y1)
y1fd=mat2fd(y1,list(lambda=1))



