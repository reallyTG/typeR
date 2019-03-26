library(copBasic)


### Name: densityCOP
### Title: Density of a Copula
### Aliases: densityCOP
### Keywords: visualization copula (density) Joe (2014) Examples and
###   Exercises

### ** Examples

# Joe (2014, p. 164) shows the closed form copula density for the Plackett.
"dPLACKETTcop" <- function(u,v,para) {
   uv <- u*v; upv <- u + v; eta <- para - 1
   A <- para*(1+eta*(upv - 2*uv)); B <- ((1+eta*upv)^2 - 4*para*eta*uv)^(3/2)
   return(A/B)
}
dPLACKETTcop(0.32, 0.74,            para=1.3) # 0.9557124
densityCOP(  0.32, 0.74, cop=PLcop, para=1.3) # 0.9557153

## Not run: 
##D # Joe (2014, p. 165) shows the corner densities of the Plackett as Theta.
##D # copBasic uses numerical density estimation and not analytical formula.
##D eps <- .Machine$double.eps
##D densityCOP(0,0, cop=PLcop, para=4) # 3.997073  (default eps^0.25)
##D densityCOP(1,1, cop=PLcop, para=4) # 3.997073  (default eps^0.25)
##D densityCOP(1,1, cop=PLcop, para=4, deluv=eps)     # 0 (silent failure)
##D densityCOP(1,1, cop=PLcop, para=4, deluv=eps^0.5) # 4.5
##D densityCOP(1,1, cop=PLcop, para=4, deluv=eps^0.4) # 4.002069
##D densityCOP(1,1, cop=PLcop, para=4, deluv=eps^0.3) # 3.999513
##D # So we see that the small slicing does have an effect, the default of 0.25 is
##D # intented for general application by being away enough from machine limits. 
## End(Not run)

## Not run: 
##D # Joe (2014, p. 170) shows the closed form copula density for "Bivariate Joe/B5" copula
##D "dJOEB5cop" <- function(u,v,para) {
##D    up <- (1-u)^para; vp <- (1-v)^para; eta <- para - 1
##D    A <- (up + vp - up*vp); B <- (1-u)^eta * (1-v)^eta; C <- (eta + A)
##D    return(A^(-2 + 1/para) * B * C)
##D }
##D densityCOP(0.32, 0.74, cop=JOcopB5, para=1.3)  # 0.9410653
##D dJOEB5cop( 0.32, 0.74, para=1.3)               # 0.9410973 
## End(Not run)



