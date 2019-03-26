library(hoa)


### Name: mpl
### Title: Maximum Adjusted Profile Likelihood Estimation - Generic
###   Function
### Aliases: mpl
### Keywords: models

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, hoa = TRUE, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)) )
mpl( metsulfuron.nl, trace = TRUE )
##
options( object.size = 10000000 )
data(chlorsulfuron)
chlorsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
        weights = ~ ( 1+k*dose^g*(b2-b1)^2/(1+(dose/b4)^b3)^4*b3^2*dose^(2*b3-2)/
                    b4^(2*b3)/(b1+(b2-b1)/(1+(dose/b4)^b3))^2 ),
        start = c(b1 = 2.2, b2 = 1700, b3 = 2.8, b4 = 0.28, g = 2.7, k = 1), 
        data = chlorsulfuron, hoa = TRUE, trace = TRUE,  
        control = list(x.tol = 10^-12, rel.tol = 10^-12, step.min = 10^-12) )
mpl( chlorsulfuron.nl, trace = TRUE )



