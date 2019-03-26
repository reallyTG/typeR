library(nlreg)


### Name: plot.nlreg.contours
### Title: Use plot() on a 'nlreg.contours' object
### Aliases: plot.nlreg.contours
### Keywords: methods hplot regression nonlinear

### ** Examples

## Not run: 
##D data(metsulfuron)
##D metsulfuron.nl <- 
##D     nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
##D            weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
##D            start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
##D            hoa = TRUE )
##D ##
##D metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
##D metsulfuron.cont <- contour( metsulfuron.prof, ret = TRUE, plotit = FALSE )
##D par( mai = rep(0.2, 4) )
##D plot( metsulfuron.cont )
## End(Not run)



