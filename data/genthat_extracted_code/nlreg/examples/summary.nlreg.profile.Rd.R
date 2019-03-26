library(nlreg)


### Name: summary.nlreg.profile
### Title: Summary Method for Objects of Class 'nlreg.profile'
### Aliases: summary.nlreg.profile
### Keywords: methods regression nonlinear

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, offset = g, trace = TRUE )
summary( metsulfuron.prof, alpha = c(0.9, 0.95) )



