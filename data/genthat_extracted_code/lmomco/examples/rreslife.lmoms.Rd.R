library(lmomco)


### Name: rreslife.lmoms
### Title: L-moments of Reversed Residual Life
### Aliases: rreslife.lmoms
### Keywords: lifetime/reliability analysis L-moment (residual life)
###   L-moment (theoretical)

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
"afunc" <- function(p)        { return(par2qua(p,A,paracheck=FALSE)) }
"bfunc" <- function(p,u=NULL) { return((2*p - u)*par2qua(p,A,paracheck=FALSE)) }
f <- 0.35
rL1a <- integrate(afunc, lower=0, upper=f)$value      / f   # Nair et al. (2013, eq. 6.18)
rL2a <- integrate(bfunc, lower=0, upper=f, u=f)$value / f^2 # Nair et al. (2013, eq. 6.19)
rL <- rreslife.lmoms(f, A, nmom=2) # The data.frame shows equality of the two approaches.
rL1b <- rL$lambdas[1]; rL2b <- rL$lambdas[2]
print(data.frame(rL1a=rL1a, rL1b=rL1b, rL2b=rL2b, rL2b=rL2b))
## Not run: 
##D # 2nd Example, let us look at Tau3, each of the L-skews are the same.
##D T3    <- par2lmom(A)$ratios[3]
##D T3.0  <-  reslife.lmoms(0, A)$ratios[3]
##D rT3.1 <- rreslife.lmoms(1, A)$ratios[3]
## End(Not run)
## Not run: 
##D # Nair et al. (2013, p. 212), test shows rL2(u=0.77) = 12.6034
##D A <- vec2par(c(230, 269, 3.3), type="gpa"); F <- 0.77
##D "afunc" <- function(p) { return(p*rrmlmomco(p,A)) }
##D rL2u1 <- (F)^(-2)*integrate(afunc,0,F)$value
##D rL2u2 <- rreslife.lmoms(F,A)$lambdas[2]
## End(Not run)



