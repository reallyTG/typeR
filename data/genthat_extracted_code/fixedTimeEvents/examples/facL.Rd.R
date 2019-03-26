library(fixedTimeEvents)


### Name: facL
### Title: Approximated logarithm of factorials
### Aliases: facL

### ** Examples

# Some values of the logarithm of factorials.
facL( c(2,10,100,1000) )
log( factorial( c(2,10,100,1000) ) )

# Fraction of two factorials
exp( facL(200)-facL(180) )
factorial(200)/factorial(180)



