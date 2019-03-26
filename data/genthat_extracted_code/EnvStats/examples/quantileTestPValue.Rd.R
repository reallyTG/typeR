library(EnvStats)


### Name: quantileTestPValue
### Title: Compute p-Value for the Quantile Test
### Aliases: quantileTestPValue
### Keywords: htest models

### ** Examples

  # Reproduce the first column of Table A.9 in USEPA (1994, p.A.25):
  #-----------------------------------------------------------------

  p.vals <- quantileTestPValue(m = 5, n = seq(15, 45, by = 5), 
    r = c(9, 3, 4, 4, 5, 5, 6), k = c(4, 2, 2, 2, 2, 2, 2)) 

  round(p.vals, 3) 
  #[1] 0.098 0.091 0.119 0.089 0.109 0.087 0.103 

  #==========

  # Clean up
  #---------

  rm(p.vals)



