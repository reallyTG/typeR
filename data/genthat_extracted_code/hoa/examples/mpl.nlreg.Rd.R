library(hoa)


### Name: mpl.nlreg
### Title: Maximum Adjusted Profile Likelihood Estimates for a 'nlreg'
###   Object
### Aliases: mpl.nlreg
### Keywords: regression nonlinear methods

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, hoa = TRUE, 
          start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)) )
##
## MMPLE of the variance parameters
##
metsulfuron.mpl <- mpl( metsulfuron.nl, trace = TRUE )
summary( metsulfuron.mpl, corr = FALSE )
##
## constrained MLEs of the regression coefficients  
##
metsulfuron.mpl <- mpl( metsulfuron.nl, offset = metsulfuron.nl$varPar, 
                        trace = TRUE )
summary( metsulfuron.mpl, corr = FALSE )



