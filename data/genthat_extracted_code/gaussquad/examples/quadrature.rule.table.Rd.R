library(gaussquad)


### Name: quadrature.rule.table
### Title: Generate the quadrature rule table
### Aliases: quadrature.rule.table
### Keywords: math

### ** Examples

###
### generate the list of quadrature rules for
### the Chebyshev T polynomials
### of orders 1 to 5
###
rules <- chebyshev.t.quadrature.rules( 5 )
###
### construct the rule table
###
rule.table <- quadrature.rule.table( rules )
print( rule.table )



