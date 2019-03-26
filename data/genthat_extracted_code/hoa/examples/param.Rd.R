library(hoa)


### Name: param
### Title: Extract All Parameters from a Model - Generic Function
### Aliases: param
### Keywords: models methods

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
param( metsulfuron.nl )
##          b1           b2           b3           b4            g         logs
## 139.0395322 2471.5097481    1.7091297    0.0772535   -1.2582597   -3.8198406



