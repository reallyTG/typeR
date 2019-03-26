library(BarBorGradient)


### Name: BarBor
### Title: How to use BarBor function minimum approximator.
### Aliases: BarBor

### ** Examples

test1 = expression(x1*x1+10*x2*x2)
eps = 10^-15
x = c(3,4)
v = c("x1","x2")
n = 10000
BarBor(test1,eps,x,v,n)



