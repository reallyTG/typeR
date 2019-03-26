library(SimplicialCubature)


### Name: adaptIntegrateSimplex
### Title: Integrate a general function over a simplex
### Aliases: adaptIntegrateSimplex integrate.vector.fn original.coordinates

### ** Examples

n <- 4
S <- CanonicalSimplex( n )
f1 <- function( x ) { x[1]^3 } 
adaptIntegrateSimplex( f1, S )   # correct answer 0.00119047619
str( adaptIntegrateSimplex( f1, S, partitionInfo=TRUE ) ) # same result, with more info returned

# test with vector valued integrand
f2 <- function( x ) { c(x[1]^3,x[3]^4) } 
adaptIntegrateSimplex( f2, S, fDim=2 )  # correct answer 0.00119047619 0.0005952380952

# test with vector valued integrand and extra arguments
f3 <- function( x, extra.arg ) { extra.arg*c(x[1]^3,x[3]^4) } # multiple of f2 above
adaptIntegrateSimplex( f3, S, fDim=2, extra.arg=100 )  # correct answer 0.119047619 0.05952380952

# integrate over lower dimensional simplices
adaptIntegrateSimplex( f1, UnitSimplexV(4) )  # answer =  0.01666667

f4 <- function(x) { 1 }
#  2-dim integral, exact answer area of unit simplex = sqrt(3)/2 = 0.8660254...
adaptIntegrateSimplex( f4, UnitSimplexV(3) ) 

# line integral over diamond in 2-dim, exact answer=arclength=4*sqrt(2)=5.656854...
S4 <- array( c( 1,0, 0,1,  0,1, -1,0,  -1,0, 0,-1,  0,-1, 1,0) , dim=c(2,2,4)  )
adaptIntegrateSimplex( f4, S4 ) 
adaptIntegrateSimplex( f4, S4, partitionInfo=TRUE ) 




