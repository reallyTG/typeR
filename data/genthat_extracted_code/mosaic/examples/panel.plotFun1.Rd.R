library(mosaic)


### Name: panel.plotFun1
### Title: Panel function for plotting functions
### Aliases: panel.plotFun1

### ** Examples

x <- runif(30,0,2*pi) 
d <- data.frame( x = x,  y = sin(x) + rnorm(30,sd=.2) )
xyplot( y ~ x, data=d )
ladd(panel.plotFun1( sin, col='red' ) )
xyplot( y ~ x | rbinom(30,1,.5), data=d )
ladd(panel.plotFun1( sin, col='red', lty=2 ) )    # plots sin(x) in each panel



