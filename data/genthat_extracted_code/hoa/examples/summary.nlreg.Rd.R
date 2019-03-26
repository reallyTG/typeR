library(hoa)


### Name: summary.nlreg
### Title: Summary Method for Nonlinear Heteroscedastic Models
### Aliases: summary.nlreg
### Keywords: methods regression nonlinear

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
summary( metsulfuron.nl, digits = 3 )
##
print( summary( metsulfuron.nl )$cov, digits = 3 )
print( summary( metsulfuron.nl, observed = FALSE )$cov, digits = 3 )



