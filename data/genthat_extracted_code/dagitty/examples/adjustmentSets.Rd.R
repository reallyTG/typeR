library(dagitty)


### Name: adjustmentSets
### Title: Covariate Adjustment Sets
### Aliases: adjustmentSets

### ** Examples

# The M-bias graph showing that adjustment for 
# pre-treatment covariates is not always valid
g <- dagitty( "dag{ x -> y ; x <-> m <-> y }" )
adjustmentSets( g, "x", "y" ) # empty set
# Generate data where true effect (=path coefficient) is .5
set.seed( 123 ); d <- simulateSEM( g, .5, .5 )
confint( lm( y ~ x, d ) )["x",] # includes .5
confint( lm( y ~ x + m, d ) )["x",] # does not include .5

# Adjustment sets can also sometimes be computed for graphs in which not all 
# edge directions are known
g <- dagitty("pdag { x[e] y[o] a -- {i z b}; {a z i} -> x -> y <- {z b} }")
adjustmentSets( g )



