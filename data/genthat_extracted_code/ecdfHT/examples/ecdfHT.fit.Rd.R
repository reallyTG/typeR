library(ecdfHT)


### Name: ecdfHT.fit
### Title: Fit heavy tailed data with a semi-parameteric model
### Aliases: ecdfHT.fit ecdfHT.fit.tails

### ** Examples

x <- rcauchy( 1000 )
a <- ecdfHT( x )
fit <- ecdfHT.fit( c(.1,.9), a, col='red' )
str(fit)




