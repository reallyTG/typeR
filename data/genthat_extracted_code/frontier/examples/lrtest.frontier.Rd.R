library(frontier)


### Name: lrtest.frontier
### Title: Likelihood Ratio test for Stochastic Frontier Models
### Aliases: lrtest.frontier
### Keywords: models

### ** Examples

# rice producers in the Philippines (panel data)
data( "riceProdPhil" )
library( "plm" )
riceProdPhil <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

# Error Components Frontier with truncated normal distribution
# and time effects (unrestricted model)
mu <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
   truncNorm = TRUE, timeEffect = TRUE, data = riceProdPhil )

# Error Components Frontier with half-normal distribution
# without time effects (restricted model)
mr <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
   data = riceProdPhil )

## compare the two models by an LR-test
lrtest( mu, mr )

## compare each of the models to a corresponding model without inefficiency
lrtest( mu )
lrtest( mr )



