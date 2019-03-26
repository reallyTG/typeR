library(npsf)


### Name: summary.npsf
### Title: 'summary' method for class 'npsf'
### Aliases: summary.npsf print.summary.npsf
### Keywords: Stochastic Frontier Analysis Panel Data Model
###   Heteroskedasticity Truncated normal Parametric efficiency analysis
###   Data Envelopment Analysis Nonradial measure Radial measure
###   Nonparametric efficiency analysis Linear programming Bootstrap
###   Smoothed bootstrap Subsampling bootstrap Parallel computing summary

### ** Examples

require( npsf )
 
# Load Penn World Tables 5.6 dataset
 
data( pwt56 )
 
# Stochastic production frontier model with 
# homoskedastic error components (half-normal)
 
# Use subset of observations - for year 1965

# DEA

t1 <- teradialbc ( Y ~ K + L, data = pwt56, subset = Nu < 10, 
 reps = 199, print.level = 0)
summary(t1)

# SFA
 
m1 <- sf(log(Y) ~ log(L) + log(K), data = pwt56, 
 subset = year == 1965, distribution = "h",
 print.level = 0)
summary( m1 )

# Load U.S. commercial banks dataset
 
data(banks05)

m3 <- sf(lnC ~ lnw1 + lnw2 + lny1 + lny2, ln.var.u.0i = ~ ER, 
         ln.var.v.0i = ~ LA, data = banks05, distribution = "t", 
         prod = FALSE, print.level = 3)
 
summary(m3)




