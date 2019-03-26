library(lmomco)


### Name: quawei
### Title: Quantile Function of the Weibull Distribution
### Aliases: quawei
### Keywords: distribution quantile function Distribution: Weibull

### ** Examples

  # Evaluate Weibull deployed here and within R (qweibull)
  lmr <- lmoms(c(123,34,4,654,37,78))
  WEI <- parwei(lmr)
  Q1  <- quawei(0.5,WEI)
  Q2  <- qweibull(0.5,shape=WEI$para[3],scale=WEI$para[2])-WEI$para[1]
  if(Q1 == Q2) EQUAL <- TRUE

  # The Weibull is a reversed generalized extreme value
  Q <- sort(rlmomco(34,WEI)) # generate Weibull sample
  lm1 <- lmoms(Q)    # regular L-moments
  lm2 <- lmoms(-Q)   # L-moment of negated (reversed) data
  WEI <- parwei(lm1) # parameters of Weibull
  GEV <- pargev(lm2) # parameters of GEV
  F <- nonexceeds()  # Get a vector of nonexceedance probs
  plot(pp(Q),Q)
  lines(F,quawei(F,WEI))
  lines(F,-quagev(1-F,GEV),col=2) # line over laps previous



