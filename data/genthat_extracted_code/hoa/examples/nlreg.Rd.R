library(hoa)


### Name: nlreg
### Title: Fit a Nonlinear Heteroscedastic Model via Maximum Likelihood
### Aliases: nlreg
### Keywords: regression nonlinear

### ** Examples

library(boot)
data(calcium)
##
## Homoscedastic model fit
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), start = c(b0 = 4, b1 = 0.1),
                     data = calcium )
##
## Heteroscedastic model fit 
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2,
                     start = c(b0 = 4, b1 = 0.1, g = 1), data = calcium, 
                     hoa = TRUE)
## or
calcium.nl <- update(calcium.nl, weights = ~ (1+time^g)^2, 
                     start = c(b0 = 4, b1 = 0.1, g = 1), hoa = TRUE )
##
##
## Power-of-X (POX) variance function
##
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
##
## Power-of-mean (POM) variance function
##
data(ria)
ria.nl <- nlreg( count ~ b1+(b2-b1) / (1+(conc/b4)^b3), 
                 weights = ~ ( b1+(b2-b1) / (1+(conc/b4)^b3) )^g, data = ria, 
                 start = c(b1 = 1.6, b2 = 20, b3 = 2, b4 = 300, g = 2),
                 hoa = TRUE, trace = TRUE )
##
##
## Error-in-variables (EIV) variance function
##
data(chlorsulfuron)
options( object.size = 10000000 )
chlorsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
        weights = ~ ( 1+k*dose^g*(b2-b1)^2/(1+(dose/b4)^b3)^4*b3^2*dose^(2*b3-2)/
                    b4^(2*b3)/(b1+(b2-b1)/(1+(dose/b4)^b3))^2 ),
        start = c(b1 = 2.2, b2 = 1700, b3 = 2.8, b4 = 0.28, g = 2.7, k = 1), 
        data = chlorsulfuron, hoa = TRUE, trace = TRUE,  
        control = list(x.tol = 10^-12, rel.tol = 10^-12, step.min = 10^-12) )



