library(EnvStats)


### Name: LognormalMix
### Title: Mixture of Two Lognormal Distributions
### Aliases: LognormalMix dlnormMix plnormMix qlnormMix rlnormMix
### Keywords: distribution datagen

### ** Examples

  # Density of a lognormal mixture with parameters meanlog1=0, sdlog1=1, 
  # meanlog2=2, sdlog2=3, p.mix=0.5, evaluated at 1.5: 

  dlnormMix(1.5, meanlog1 = 0, sdlog1 = 1, meanlog2 = 2, sdlog2 = 3, p.mix = 0.5) 
  #[1] 0.1609746

  #----------

  # The cdf of a lognormal mixture with parameters meanlog1=0, sdlog1=1, 
  # meanlog2=2, sdlog2=3, p.mix=0.2, evaluated at 4: 

  plnormMix(4, 0, 1, 2, 3, 0.2) 
  #[1] 0.8175281

  #----------

  # The median of a lognormal mixture with parameters meanlog1=0, sdlog1=1, 
  # meanlog2=2, sdlog2=3, p.mix=0.2: 

  qlnormMix(0.5, 0, 1, 2, 3, 0.2) 
  #[1] 1.156891

  #----------

  # Random sample of 3 observations from a lognormal mixture with 
  # parameters meanlog1=0, sdlog1=1, meanlog2=3, sdlog2=4, p.mix=0.2. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnormMix(3, 0, 1, 2, 3, 0.2) 
  #[1] 0.08975283 1.07591103 7.85482514



