library(miscTools)


### Name: compPlot
### Title: Scatterplot to Compare two Variables
### Aliases: compPlot
### Keywords: models

### ** Examples

   set.seed( 123 )
   x <- runif( 25 )
   y <- 2 + 3 * x + rnorm( 25 )
   ols <- lm( y ~ x )
   
   compPlot( y, fitted( ols ) )
   compPlot( y, fitted( ols ), lim = c( 0, 10 ) )
   compPlot( y, fitted( ols ), pch = 20 )
   compPlot( y, fitted( ols ), xlab = "observed", ylab = "fitted" )
   compPlot( y, fitted( ols ), log = "xy" )



