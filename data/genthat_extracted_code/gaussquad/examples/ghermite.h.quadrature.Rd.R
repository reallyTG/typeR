library(gaussquad)


### Name: ghermite.h.quadrature
### Title: Perform generalized Gauss Hermite quadrature
### Aliases: ghermite.h.quadrature
### Keywords: math

### ** Examples

###
### this example evaluates the quadrature function for
### the generalized Hermite H polynomials.  it computes the integral
### of the product for all pairs of orthogonal polynomials
### from order 0 to order 10.  the results are compared to
### the diagonal matrix of the inner products for the
### polynomials.  it also computes the integral of the product
### of all pairs of orthonormal polynomials from order 0
### to order 10.  the resultant matrix should be an identity matrix
###
###
### set the polynomial parameter
###
    mu <- 1
###
### set the value for the maximum polynomial order
###
    n <- 10
###
### maximum order plus 1
###
    np1 <- n + 1
###
### function to construct the polynomial products by column
###
by.column.products <- function( c, p.list, p.p.list )
{
###
### function to construct the polynomial products by row
###
    by.row.products <- function( r, c, p.list )
    {
        row.column.product <- p.list[[r]] * p.list[[c]]
        return (row.column.product )
    }
    np1 <- length( p.list )
    row.list <- lapply( 1:np1, by.row.products, c, p.list )
    return( row.list )
}
###
### function construct the polynomial functions by column
###
by.column.functions <- function( c, p.p.products )
{
###
### function to construct the polynomial functions by row
###
    by.row.functions <- function( r, c, p.p.products )
    {
        row.column.function <- as.function( p.p.products[[r]][[c]] )
        return( row.column.function )
    }
    np1 <- length( p.p.products[[1]] )
    row.list <- lapply( 1:np1, by.row.functions, c, p.p.products )
    return( row.list )
}
###
### function to compute the integral of the polynomials by column
###
by.column.integrals <- function( c, p.p.functions )
{
###
### function to compute the integral of the polynomials by row
###
    by.row.integrals <- function( r, c, p.p.functions )
    {
        row.column.integral <- ghermite.h.quadrature(
            p.p.functions[[r]][[c]], order.np1.rule, mu )
        return( row.column.integral )
    }
    np1 <- length( p.p.functions[[1]] )
    row.vector <- sapply( 1:np1, by.row.integrals, c, p.p.functions )
    return( row.vector )
}
###
### construct a list of the generalized Hermite H orthogonal polynomials
###
p.list <- ghermite.h.polynomials( n, mu )
###
### construct the two dimensional list of pair products
### of polynomials
###
p.p.products <- lapply( 1:np1, by.column.products, p.list )
###
### compute the two dimensional list of functions
### corresponding to the polynomial products in
### the two dimensional list p.p.products
###
p.p.functions <- lapply( 1:np1, by.column.functions, p.p.products )
###
### get the rule table for the order np1 polynomial
###
rules <- ghermite.h.quadrature.rules( np1, mu )
order.np1.rule <- rules[[np1]]
###
### construct the square symmetric matrix containing
### the definite integrals over the default limits
### corresponding to the two dimensional list of
### polynomial functions
###
p.p.integrals <- sapply( 1:np1, by.column.integrals, p.p.functions )
###
### construct the diagonal matrix with the inner products
### of the orthogonal polynomials on the diagonal
###
p.p.inner.products <- diag( ghermite.h.inner.products( n, mu ) )
print( "Integral of cross products for the orthogonal polynomials " )
print( apply( p.p.integrals, 2, round, digits=5 ) )
print( apply( p.p.inner.products, 2, round, digits=5 ) )
###
### construct a list of the Hermite H orthonormal polynomials
###
p.list <- ghermite.h.polynomials( n, mu, TRUE )
###
### construct the two dimensional list of pair products
### of polynomials
###
p.p.products <- lapply( 1:np1, by.column.products, p.list )
###
### compute the two dimensional list of functions
### corresponding to the polynomial products in
### the two dimensional list p.p.products
###
p.p.functions <- lapply( 1:np1, by.column.functions, p.p.products )
###
### get the rule table for the order np1 polynomial
###
rules <- ghermite.h.quadrature.rules( np1, mu, TRUE )
order.np1.rule <- rules[[np1]]
###
### construct the square symmetric matrix containing
### the definite integrals over the default limits
### corresponding to the two dimensional list of
### polynomial functions
###
p.p.integrals <- sapply( 1:np1, by.column.integrals, p.p.functions )
###
### display the matrix of integrals
###
print( "Integral of cross products for the orthonormal polynomials " )
print(apply( p.p.integrals, 2, round, digits=5 ) )



