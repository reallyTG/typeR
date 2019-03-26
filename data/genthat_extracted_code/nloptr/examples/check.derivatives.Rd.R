library(nloptr)


### Name: check.derivatives
### Title: Check analytic gradients of a function using finite difference
###   approximations
### Aliases: check.derivatives
### Keywords: interface optimize

### ** Examples


library('nloptr')

# example with correct gradient
f <- function( x, a ) {
	return( sum( ( x - a )^2 ) )
}

f_grad <- function( x, a ) {
	return( 2*( x - a ) )
}

check.derivatives( .x=1:10, func=f, func_grad=f_grad,
    check_derivatives_print='none', a=runif(10) )

# example with incorrect gradient
f_grad <- function( x, a ) {
	return( 2*( x - a ) + c(0,.1,rep(0,8)) )
}

check.derivatives( .x=1:10, func=f, func_grad=f_grad,
    check_derivatives_print='errors', a=runif(10) )

# example with incorrect gradient of vector-valued function
g <- function( x, a ) {
	return( c( sum(x-a), sum( (x-a)^2 ) ) )
}

g_grad <- function( x, a ) {
	return( rbind( rep(1,length(x)) + c(0,.01,rep(0,8)), 2*(x-a) + c(0,.1,rep(0,8)) ) )
}

check.derivatives( .x=1:10, func=g, func_grad=g_grad,
    check_derivatives_print='all', a=runif(10) )




