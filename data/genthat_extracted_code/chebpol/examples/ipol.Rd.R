library(chebpol)


### Name: ipol
### Title: Create interpolating function.
### Aliases: ipol

### ** Examples


## evenly spaced grid-points
su <- seq(0,1,length.out=10)
## irregularly spaced grid-points
s <- su^3
## create approximation on the irregularly spaced grid
ml1 <- ipol(exp, grid=list(s), method='multilin')
fh1 <- ipol(exp, grid=list(s), method='fh')
## test it, since exp is convex, the linear approximation lies above
## the exp between the grid points
ml1(su) - exp(su)
fh1(su) - exp(su)

## multi dimensional approximation
f <- function(x) 10/(1+25*mean(x^2))
# a 3-dimensional 10x10x10 grid, first and third coordinate are non-uniform
grid <- list(s, su, sort(1-s))

# make multilinear, Floater-Hormann, Chebyshev and polyharmonic spline.
ml2 <- ipol(f, grid=grid, method='multilin')
fh2 <- ipol(f, grid=grid, method='fh')
ch2 <- ipol(f, dims=c(10,10,10), intervals=list(0:1,0:1,0:1), method='cheb')
knots <- matrix(runif(3*1000),3)
ph2 <- ipol(f, knots=knots, k=2, method='poly')
sl2 <- ipol(f, knots=knots, method='simplexlinear')
# my alglib is a bit slow, so stick to 100 knots
if(havealglib()) crb <- ipol(f, knots=knots[,1:100], method='crbf',
  rbase=2, layers=5, lambda=0) 
# make 7 points in R3 to test them on
m <- matrix(runif(3*7),3)
rbind(true=apply(m,2,f), ml=ml2(m), fh=fh2(m), cheb=ch2(m), poly=ph2(m), sl=sl2(m),
crbf=if(havealglib()) crb(m) else NULL )




