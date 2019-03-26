library(lmomco)


### Name: pdfgld
### Title: Probability Density Function of the Generalized Lambda
###   Distribution
### Aliases: pdfgld
### Keywords: distribution probability density function Distribution:
###   Generalized Lambda

### ** Examples

## Not run: 
##D # Using Karian and Dudewicz, 2000, p. 10
##D gld <- vec2par(c(0.0305,1/1.3673,0.004581,0.01020),type='gld')
##D quagld(0.25,gld) # which equals about 0.028013 as reported by K&D
##D pdfgld(0.028013,gld) # which equals about 43.04 as reported by K&D
##D F <- seq(.001,.999,by=.001)
##D x <- quagld(F,gld)
##D plot(x, pdfgld(x,gld), type='l', xlim=c(0,.1))
## End(Not run)



