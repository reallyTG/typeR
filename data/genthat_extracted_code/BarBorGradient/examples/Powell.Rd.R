library(BarBorGradient)


### Name: Powell
### Title: Powell's method for finding a functions local minimum.
### Aliases: Powell

### ** Examples

test1 = expression(100*(x1*x1-x2)*(x1*x1-x2)+(1-x1)*(1-x1))
eps = 10^-5
G = 10^-2
eta = G *2
m = 20
k = 20
n = 10000
max = 1000
x = c(1,1)
v = c("x1","x2")
Powell(test1,eps,G,eta,m,k,x,v,n)



