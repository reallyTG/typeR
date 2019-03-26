library(lmomco)


### Name: cdfwei
### Title: Cumulative Distribution Function of the Weibull Distribution
### Aliases: cdfwei
### Keywords: distribution cumulative distribution function Distribution:
###   Weibull

### ** Examples

  # Evaluate Weibull deployed here and within R (pweibull)
  lmr <- lmoms(c(123,34,4,654,37,78))
  WEI <- parwei(lmr)
  F1  <- cdfwei(50,WEI)
  F2  <- pweibull(50+WEI$para[1],shape=WEI$para[3],scale=WEI$para[2])
  if(F1 == F2) EQUAL <- TRUE

  # The Weibull is a reversed generalized extreme value
  Q <- sort(rlmomco(34,WEI)) # generate Weibull sample
  lm1 <- lmoms(Q)    # regular L-moments
  lm2 <- lmoms(-Q)   # L-moment of negated (reversed) data
  WEI <- parwei(lm1) # parameters of Weibull
  GEV <- pargev(lm2) # parameters of GEV
  F <- nonexceeds()  # Get a vector of nonexceedance probs
  plot(pp(Q),Q)
  lines(cdfwei(Q,WEI),Q,lwd=5,col=8)
  lines(1-cdfgev(-Q,GEV),Q,col=2) # line overlaps previous



