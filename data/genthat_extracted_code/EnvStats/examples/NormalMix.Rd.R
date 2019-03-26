library(EnvStats)


### Name: NormalMix
### Title: Mixture of Two Normal Distributions
### Aliases: NormalMix dnormMix pnormMix qnormMix rnormMix
### Keywords: distribution datagen

### ** Examples

  # Density of a normal mixture with parameters mean1=0, sd1=1, 
  #  mean2=4, sd2=2, p.mix=0.5, evaluated at 1.5: 

  dnormMix(1.5, mean2=4, sd2=2) 
  #[1] 0.1104211

  #----------

  # The cdf of a normal mixture with parameters mean1=10, sd1=2, 
  # mean2=20, sd2=2, p.mix=0.1, evaluated at 15: 

  pnormMix(15, 10, 2, 20, 2, 0.1) 
  #[1] 0.8950323

  #----------

  # The median of a normal mixture with parameters mean1=10, sd1=2, 
  # mean2=20, sd2=2, p.mix=0.1: 

  qnormMix(0.5, 10, 2, 20, 2, 0.1) 
  #[1] 10.27942

  #----------

  # Random sample of 3 observations from a normal mixture with 
  # parameters mean1=0, sd1=1, mean2=4, sd2=2, p.mix=0.5. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rnormMix(3, mean2=4, sd2=2)
  #[1] 0.07316778 2.06112801 1.05953620



