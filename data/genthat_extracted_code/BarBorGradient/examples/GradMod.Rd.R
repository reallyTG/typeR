library(BarBorGradient)


### Name: Gradient Method
### Title: Gradient method for function minimum approximation.
### Aliases: Gradmod

### ** Examples

test1 = expression(x1*x1+10*x2*x2)
eps = 10^-10
G = 10^-2
B = 0.5
m = 20
x = c(3,4)
v = c("x1","x2")
n = 10000
Gradmod(test1,eps,G,B,m,x,v,n)



