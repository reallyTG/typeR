library(hoa)


### Name: obsInfo
### Title: Returns the Observed Information Matrix - Generic Function
### Aliases: obsInfo
### Keywords: models

### ** Examples

data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ),
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)), 
           hoa = TRUE)
obsInfo( metsulfuron.nl )



