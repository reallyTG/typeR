library(KRIG)


### Name: linear_kernel
### Title: Linear kernel
### Aliases: linear_kernel

### ** Examples

n<-10
x<-matrix( runif( n ), n, 1 )
y<-matrix( runif( n ), n, 1 )
alpha<-0.5
linear_kernel( x, y, alpha )



