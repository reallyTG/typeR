library(BarBorGradient)


### Name: BarBorNoPrint
### Title: The BarBor funtcion without printing.
### Aliases: BarBorNoPrint

### ** Examples

test1 = expression(x1*x1+10*x2*x2)
eps = 10^-15
x = c(3,4)
v = c("x1","x2")
n = 10000
BarBorNoPrint(test1,eps,x,v,n)



