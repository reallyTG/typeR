library(samplesizelogisticcasecontrol)


### Name: sampleSize_continuous
### Title: Sample size for a continuous exposure
### Aliases: sampleSize_continuous

### ** Examples

  prev  <- 0.01
  logOR <- 0.3

  # No confounders, exposure assumed to be N(0,1)
  sampleSize_continuous(prev, logOR) 

  # Two confounders and exposure assumed to be MVN(0,1)
  beta <- c(0.1, 0.1, logOR)
  sampleSize_continuous(prev, beta) 

  # No confounders, exposure is beta(0.3, 3)
  sampleSize_continuous(prev, logOR, distF="dbeta(m, shape1=0.3, shape2=3)",
                        distF.support=c(0, 1)) 



