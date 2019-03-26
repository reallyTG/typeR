library(gaussquad)


### Name: quadrature.rules
### Title: Create a list of quadrature rule data frames
### Aliases: quadrature.rules
### Keywords: math

### ** Examples

###
### get recurrences the Chebyshev T orthgonal polynomials
### of orders 0 to 6\5
###
recurrences <- chebyshev.t.recurrences( 5 )
###
### get the inner products of these polynomials
###
inner.products <- chebyshev.t.inner.products( 5 )
###
### get the quadrature rules
###
rules <- quadrature.rules( recurrences, inner.products )
print( rules )



