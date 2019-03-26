library(SDraw)


### Name: extended.gcd
### Title: Extended Greatest Common Denominator (GCD) algorithm.
### Aliases: extended.gcd

### ** Examples

 x <- extended.gcd( c(16,27,27,46), c(9,16,9,240) )
 
 #  Check
 cbind(x$a*x$t + x$b*x$s, x$gcd)
 



