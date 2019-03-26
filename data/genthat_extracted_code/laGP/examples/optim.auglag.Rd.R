library(laGP)


### Name: optim.auglag
### Title: Optimize an objective function under multiple blackbox
###   constraints
### Aliases: optim.auglag optim.efi
### Keywords: optimize design

### ** Examples

## this example assumes a known linear objective; further examples
## are in the optim.auglag demo

## a test function returning linear objective evaluations and 
## non-linear constraints
aimprob <- function(X, known.only = FALSE)
{
  if(is.null(nrow(X))) X <- matrix(X, nrow=1)
  f <- rowSums(X)
  if(known.only) return(list(obj=f))
  c1 <- 1.5-X[,1]-2*X[,2]-0.5*sin(2*pi*(X[,1]^2-2*X[,2]))
  c2 <- rowSums(X^2)-1.5
  return(list(obj=f, c=cbind(c1,c2)))
}

## set bounding rectangle for adaptive sampling
B <- matrix(c(rep(0,2),rep(1,2)),ncol=2)

## optimization (primarily) by EI, change 25 to 100 for
## 99% chance of finding the global optimum with value 0.6
library(akima) ## for plotprog=interp
out <- optim.auglag(aimprob, B, end=25, plotprog=interp)

## using the slack variable implementation which is a little slower
## but more precise; slack=2 augments random search with L-BFGS-B
  
out2 <- optim.auglag(aimprob, B, end=25, slack=TRUE)
## Not run: 
##D out3 <- optim.auglag(aimprob, B, end=25, slack=2)
## End(Not run)

## for more slack examples and comparison to optim.efi on problems
## involving equality and mixed (equality and inequality) constraints,
## see demo("ALfhat"), demo("GSBP") and demo("LAH")

## for comparison, here is a version that uses simulated annealing
## with the Additive Penalty Method (APM) for constraints
## Not run: 
##D aimprob.apm <- function(x, B=matrix(c(rep(0,2),rep(1,2)),ncol=2))
##D { 
##D   ## check bounding box
##D   for(i in 1:length(x)) {
##D     if(x[i] < B[i,1] || x[i] > B[i,2]) return(Inf)
##D   }
##D 
##D   ## evaluate objective and constraints
##D   f <- sum(x)
##D   c1 <- 1.5-x[1]-2*x[2]-0.5*sin(2*pi*(x[1]^2-2*x[2]))
##D   c2 <- x[1]^2+x[2]^2-1.5
##D 
##D   ## return APM composite
##D   return(f + abs(c1) + abs(c2))
##D }
##D 
##D ## use SA; specify control=list(maxit=100), say, to control max 
##D ## number of iterations; does not easily facilitate plotting progress
##D out4 <- optim(runif(2), aimprob.apm, method="SANN") 
##D ## check the final value, which typically does not satisfy both
##D ## constraints
##D aimprob(out4$par)
## End(Not run)

## for a version with a modeled objective see demo("ALfhat")



