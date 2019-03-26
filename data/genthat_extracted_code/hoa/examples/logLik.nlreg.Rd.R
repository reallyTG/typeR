library(hoa)


### Name: logLik.nlreg
### Title: Compute the Log Likelihood for Nonlinear Heteroscedastic Models
### Aliases: logLik.nlreg
### Keywords: methods models regression

### ** Examples

library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1), data = calcium )
logLik( calcium.nl )
##
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
logLik( metsulfuron.nl )



