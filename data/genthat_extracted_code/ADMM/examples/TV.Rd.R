library(ADMM)


### Name: admm.tv
### Title: Total Variation Minimization
### Aliases: admm.tv

### ** Examples

## generate sample data
x1 = as.vector(sin(1:100)+0.1*rnorm(100))
x2 = as.vector(cos(1:100)+0.1*rnorm(100)+5)
x3 = as.vector(sin(1:100)+0.1*rnorm(100)+2.5)
xsignal = c(x1,x2,x3)

## run example
output  = admm.tv(xsignal)

## visualize
par(mfrow=c(1,2))
plot(1:300,xsignal,"l",main="original signal")
plot(1:300,output$x,"l",main="denoised signal")




