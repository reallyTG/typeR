library(CDM)


### Name: numerical_Hessian
### Title: Numerical Computation of the Hessian Matrix
### Aliases: numerical_Hessian numerical_Hessian_partial numerical_gradient

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example for Hessian matrix
#############################################################################

# define function
f <- function(x){
     3*x[1]^3 - 4*x[2]^2 - 5*x[1]*x[2] + 10 * x[1] * x[3]^2 + 6*x[2]*sqrt(x[3])
}
# define point for evaluating partial derivatives
par <- c(3,8,4)

#--- compute gradient
CDM::numerical_Hessian( par=par, FUN=f, gradient=TRUE, hessian=FALSE)
## Not run: 
##D mirt::numerical_deriv(par=par, f=f, gradient=TRUE)
##D 
##D #--- compute Hessian matrix
##D CDM::numerical_Hessian( par=par, FUN=f )
##D mirt::numerical_deriv(par=par, f=f, gradient=FALSE)
##D numerical_Hessian( par=par, FUN=f, h=1E-4 )
##D 
##D #--- compute gradient and Hessian matrix
##D CDM::numerical_Hessian( par=par, FUN=f, gradient=TRUE, hessian=TRUE)
## End(Not run)



