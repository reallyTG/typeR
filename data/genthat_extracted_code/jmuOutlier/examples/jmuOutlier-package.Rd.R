library(jmuOutlier)


### Name: jmuOutlier-package
### Title: Permutation Tests for Nonparametric Statistics
### Aliases: jmuOutlier-package jmuOutlier
### Keywords: Nonparametric statistics Fourier analysis Power

### ** Examples

fourier (function(x){ (x-pi)^3 }, 4 )
x = rtriang(20,50) ;  list(x) ;  perm.test( x, mu=25, stat=median )
quantileCI( x, c(0.25, 0.5, 0.75)  )
power.binom.test( 20, 0.05, "less", 47, plaplace, 45.2, 3.7 )



