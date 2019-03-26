library(RandomFields)


### Name: RMave
### Title: Space-time moving average model
### Aliases: RMave
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Example of an evaluation of the ave2-covariance function
## in three different ways
## ---------------------------------------------------------
## some parameters A and z
A <- matrix(c(2,1,1,2),ncol=2)
z <- c(1,2)
## h for evalutation
h <- c(1,2)
## some abbreviations
E <- matrix(c(1,0,0,1),ncol=2)
B <- A %*% h %*% t(h) %*% A
phi <- function(t){return(RFcov(RMwhittle(1), t))}
## ---------------------------------------------------------
## the following should yield the same value 3 times
## (also for other choices of A,z and h)
z1 <- RFcov( model=RMave(RMwhittle(1),A=A,z=z) , x=t(c(h,0)) )
z2 <- RFcov( model=RMave(RMwhittle(1),A=A,z=z,spacetime=FALSE) , x=t(h) )
z3 <- ( (det(E+2*B))^(-1/2) ) *
 phi( sqrt( sum(h*h)/2 + (t(z) %*% h)^2 *
 ( 1-2*t(h) %*% A %*% solve(E+2*B) %*% A %*% h) ) )
##
## Don't show: 
if(maintainers.machine())stopifnot(abs(z1-z2)<1e-12,abs(z2-z3)<1e-12)
## End(Don't show)
## Not run:  stopifnot(abs(z1-z2)<1e-12, abs(z2-z3)<1e-12) 

## Don't show: 
FinalizeExample()
## End(Don't show)


