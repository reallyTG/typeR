library(nlreg)


### Name: profile.nlreg
### Title: Profile Method for 'nlreg' Objects
### Aliases: profile.nlreg
### Keywords: regression nonlinear methods

### ** Examples

## Not run: 
##D data(metsulfuron)
##D metsulfuron.nl <- 
##D     nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
##D            weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
##D            start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
##D            hoa = TRUE )
##D ##
##D metsulfuron.prof <- profile( metsulfuron.nl, offset = g, trace = TRUE )
##D plot( metsulfuron.prof, lwd2 = 2 )
##D #
##D metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
##D plot( metsulfuron.prof, nframe = c(2,3), lwd2 = 2 )
## End(Not run)



