library(lmomco)


### Name: pdfwei
### Title: Probability Density Function of the Weibull Distribution
### Aliases: pdfwei
### Keywords: distribution probability density function Distribution:
###   Weibull

### ** Examples

  # Evaluate Weibull deployed here and built-in function (pweibull)
  lmr <- lmoms(c(123,34,4,654,37,78))
  WEI <- parwei(lmr)
  F1  <- cdfwei(50,WEI)
  F2  <- pweibull(50+WEI$para[1],shape=WEI$para[3],scale=WEI$para[2])
  if(F1 == F2) EQUAL <- TRUE
## Not run: 
##D   # The Weibull is a reversed generalized extreme value
##D   Q <- sort(rlmomco(34,WEI)) # generate Weibull sample
##D   lm1 <- lmoms( Q)   # regular L-moments
##D   lm2 <- lmoms(-Q)   # L-moment of negated (reversed) data
##D   WEI <- parwei(lm1) # parameters of Weibull
##D   GEV <- pargev(lm2) # parameters of GEV
##D   F <- nonexceeds()  # Get a vector of nonexceedance probabilities
##D   plot(pp(Q),Q)
##D   lines(cdfwei(Q,WEI),Q,lwd=5,col=8)
##D   lines(1-cdfgev(-Q,GEV),Q,col=2) # line overlaps previous distribution
## End(Not run)



