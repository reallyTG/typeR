library(npsf)


### Name: coef.npsf
### Title: 'coef' method for class 'npsf'
### Aliases: coef.npsf
### Keywords: Stochastic Frontier Analysis Model Truncated normal
###   Parametric efficiency analysis summary

### ** Examples

require( npsf )
 
# Load Penn World Tables 5.6 dataset
 
data( pwt56 )
head( pwt56 )
 
# Create some missing values
 
pwt56 [4, "K"] <- NA 
 
# Stochastic production frontier model with 
# homoskedastic error components (half-normal)
 
# Use subset of observations - for year 1965
 
m1 <- sf(log(Y) ~ log(L) + log(K), data = pwt56, 
 subset = year == 1965, distribution = "h")
coef( m1 )



