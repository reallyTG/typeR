library(lintools)


### Name: project
### Title: Project a vector on the border of the region defined by a set of
###   linear (in)equality restrictions.
### Aliases: project

### ** Examples


# the system 
# x + y = 10
# -x <= 0   # ==> x > 0
# -y <= 0   # ==> y > 0
#
A <- matrix(c(
   1,1,
  -1,0,
   0,-1), byrow=TRUE, nrow=3
)
b <- c(10,0,0)

# x and y will be adjusted by the same amount
project(x=c(4,5), A=A, b=b, neq=1)

# One of the inequalies violated
project(x=c(-1,5), A=A, b=b, neq=1)

# Weighted distances: 'heavy' variables change less
project(x=c(4,5), A=A, b=b, neq=1, w=c(100,1))

# if w=1/x0, the ratio between coefficients of x0 stay the same (to first order)
x0 <- c(x=4,y=5)
x1 <- project(x=x0,A=A,b=b,neq=1,w=1/x0)

x0[1]/x0[2]
x1$x[1] / x1$x[2]






