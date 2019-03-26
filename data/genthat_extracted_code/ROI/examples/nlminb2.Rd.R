library(ROI)


### Name: nlminb2
### Title: Nonlinear programming with nonlinear constraints.
### Aliases: nlminb2

### ** Examples

## Equal constraint function
eval_g0_eq <- function( x, params = c(1,1,-1)) {
       return( params[1]*x^2 + params[2]*x + params[3] )
   }
eval_f0 <- function( x, ... ) {
       return( 1 )
   }





