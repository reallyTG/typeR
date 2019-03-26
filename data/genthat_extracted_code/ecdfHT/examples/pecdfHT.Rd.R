library(ecdfHT)


### Name: pecdfHT
### Title: Compute cdf, pdf, quantiles, and simulate from a fitted
###   distribution
### Aliases: decdfHT pecdfHT qecdfHT recdfHT

### ** Examples

x <- rcauchy(1000)
a <- ecdfHT( x, show.plot=FALSE )
fit <- ecdfHT.fit( c(.1,.9), a, add.to.plot=FALSE )
pecdfHT( -3:3, fit )
decdfHT( -3:3, fit )
qecdfHT( seq(.1,.9,.1), fit )
recdfHT( 10, fit )




