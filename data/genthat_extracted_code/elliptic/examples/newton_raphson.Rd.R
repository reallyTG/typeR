library(elliptic)


### Name: newton_raphson
### Title: Newton Raphson iteration to find roots of equations
### Aliases: newton_raphson Newton_raphson Newton_Raphson newton_Raphson
### Keywords: math

### ** Examples


# Find the two square roots of 2+i:
f <- function(z){z^2-(2+1i)}
fdash <- function(z){2*z}
newton_raphson( 1.4+0.3i,f,fdash,maxiter=10)
newton_raphson(-1.4-0.3i,f,fdash,maxiter=10)

# Now find the three cube roots of unity:
g <- function(z){z^3-1}
gdash <- function(z){3*z^2}
newton_raphson(-0.5+1i,g,gdash,maxiter=10)
newton_raphson(-0.5-1i,g,gdash,maxiter=10)
newton_raphson(+0.5+0i,g,gdash,maxiter=10)



