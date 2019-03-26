library(elliptic)


### Name: sn
### Title: Jacobi form of the elliptic functions
### Aliases: ss sc sn sd cs cc cn cd ns nc nn nd ds dc dn dd e16.36.3
### Keywords: math

### ** Examples


#Example 1, p579:
nc(1.9965,m=0.64)
# (some problem here)

# Example 2, p579:
dn(0.20,0.19)

# Example 3, p579:
dn(0.2,0.81)

# Example 4, p580:
cn(0.2,0.81)

# Example 5, p580:
dc(0.672,0.36)

# Example 6, p580:
Theta(0.6,m=0.36)

# Example 7, p581:
cs(0.53601,0.09)

# Example 8, p581:
sn(0.61802,0.5)

#Example 9, p581:
sn(0.61802,m=0.5)

#Example 11, p581:
cs(0.99391,m=0.5)
# (should be 0.75 exactly)

#and now a pretty picture:

n <- 300
K <- K.fun(1/2)
f <- function(z){1i*log((z-1.7+3i)*(z-1.7-3i)/(z+1-0.3i)/(z+1+0.3i))}
# f <- function(z){log((z-1.7+3i)/(z+1.7+3i)*(z+1-0.3i)/(z-1-0.3i))}
x <- seq(from=-K,to=K,len=n)
y <- seq(from=0,to=K,len=n)
z <- outer(x,1i*y,"+")

view(x, y, f(sn(z,m=1/2)), nlevels=44, imag.contour=TRUE,
     real.cont=TRUE, code=1, drawlabels=FALSE,
     main="Potential flow in a rectangle",axes=FALSE,xlab="",ylab="")
rect(-K,0,K,K,lwd=3)







