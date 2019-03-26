library(ecdfHT)


### Name: ecdfHT
### Title: Plot a transformed empirical cdf
### Aliases: ecdfHT

### ** Examples

x <- rcauchy( 1000 )
ecdfHT( x )
title("basic ecdfHT plot")

xabs <- abs(x)
ecdfHT( xabs, scale.q=c(0,0,.75) )
title("one sided data")




