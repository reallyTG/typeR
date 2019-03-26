library(gafit)


### Name: gafit
### Title: Genetic Algorithm for Curve Fitting
### Aliases: gafit
### Keywords: nonlinear regression

### ** Examples

# Single parameter, all real numbers (not using least squares)
e <- expression( cos( theta ) + sin( theta ))
guess.1 <- list( theta=3 )
guess.2 <- gafit( e, guess.1, step=1e-3 )  # First attempt with thermal noise
gafit( e, guess.2, step=1e-5, thermal=0 )  # usually gets close to 3.926991

# Double parameter, complex numbers (least square curve fit)
sumsq <- function( x ) { sum(( Mod( x )) ^ 2 )}
freq <- exp( 1:15 )
tpj <- 2 * pi * (0+1i)
data <- 1 / ( 10 + tpj * freq * 1e-3 )
e <- expression( sumsq( 1 / ( R + tpj * freq * C ) - data ))
guess.1 <- list( R=100, C=1e-6 );
guess.2 <- gafit( e, guess.1, step=0.1, maxiter=100, tolerance=1e-2 )
gafit( e, thermal=0, guess.2, step=1e-3, maxiter=200, tolerance=1e-5 )



