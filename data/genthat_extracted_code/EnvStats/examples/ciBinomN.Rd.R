library(EnvStats)


### Name: ciBinomN
### Title: Sample Size for Specified Half-Width of Confidence Interval for
###   Binomial Proportion or Difference Between Two Proportions
### Aliases: ciBinomN
### Keywords: design distribution htest

### ** Examples

  # Look at how the required sample size of a one-sample 
  # confidence interval increases with decreasing 
  # required half-width:

  ciBinomN(half.width = c(0.1, 0.05, 0.03))
  #$n
  #[1]   92  374 1030
  #
  #$p.hat
  #[1] 0.5 0.5 0.5
  #
  #$half.width
  #[1] 0.10010168 0.05041541 0.03047833
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------

  # Note that the required sample size decreases if we are less 
  # stringent about how much the confidence interval width can 
  # deviate from the supplied value of the 'half.width' argument:

  ciBinomN(half.width = c(0.1, 0.05, 0.03), tol.half.width = 0.005)
  #$n
  #[1]  84 314 782
  #
  #$p.hat
  #[1] 0.5 0.5 0.5
  #
  #$half.width
  #[1] 0.10456066 0.05496837 0.03495833
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #--------------------------------------------------------------------

  # Look at how the required sample size for a one-sample 
  # confidence interval tends to decrease as the estimated 
  # value of p decreases below 0.5 or increases above 0.5:

  seq(0.2, 0.8, by = 0.1) 
  #[1] 0.2 0.3 0.4 0.5 0.6 0.7 0.8 

  ciBinomN(half.width = 0.1, p.hat = seq(0.2, 0.8, by = 0.1)) 
  #$n
  #[1]  70  90 100  92 100  90  70
  #
  #$p.hat
  #[1] 0.2 0.3 0.4 0.5 0.6 0.7 0.8
  #
  #$half.width
  #[1] 0.09931015 0.09839843 0.09910818 0.10010168 0.09910818 0.09839843
  #[7] 0.09931015
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------------------------------------------------------------

  # Look at how the required sample size for a one-sample 
  # confidence interval increases with increasing confidence level:

  ciBinomN(half.width = 0.05, conf.level = c(0.8, 0.9, 0.95, 0.99)) 
  #$n
  #[1] 160 264 374 644
  #
  #$p.hat
  #[1] 0.5 0.5 0.5 0.5
  #
  #$half.width
  #[1] 0.05039976 0.05035948 0.05041541 0.05049152
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------------------------------------------------------------

  # Compare required sample size for a one-sample 
  # confidence interval based on the different methods:

  ciBinomN(half.width = 0.05, ci.method = "score")
  #$n
  #[1] 374
  #
  #$p.hat
  #[1] 0.5
  #
  #$half.width
  #[1] 0.05041541
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  ciBinomN(half.width = 0.05, ci.method = "exact")
  #$n
  #[1] 394
  #
  #$p.hat
  #[1] 0.5
  #
  #$half.width
  #[1] 0.05047916
  #
  #$method
  #[1] "Exact"

  ciBinomN(half.width = 0.05, ci.method = "adjusted Wald")
  #$n
  #[1] 374
  #
  #$p.hat
  #[1] 0.5
  #
  #$half.width
  #[1] 0.05041541
  #
  #$method
  #[1] "Adjusted Wald normal approximation"

  ciBinomN(half.width = 0.05, ci.method = "Wald")
  #$n
  #[1] 398
  #
  #$p.hat
  #[1] 0.5
  #
  #$half.width
  #[1] 0.05037834
  #
  #$method
  #[1] "Wald normal approximation, with continuity correction"

  #----------------------------------------------------------------

  ## Not run: 
##D   # Look at how the required sample size of a two-sample 
##D   # confidence interval increases with decreasing 
##D   # required half-width:
##D 
##D   ciBinomN(half.width = c(0.1, 0.05, 0.03), sample.type = "two")  
##D   #$n1
##D   #[1]  210  778 2089
##D   #
##D   #$n2
##D   #[1]  210  778 2089
##D   #
##D   #$p1.hat
##D   #[1] 0.5000000 0.5000000 0.4997607
##D   #
##D   #$p2.hat
##D   #[1] 0.4000000 0.3997429 0.4001915
##D   #
##D   #$half.width
##D   #[1] 0.09943716 0.05047044 0.03049753
##D   #
##D   #$method
##D   #[1] "Score normal approximation, with continuity correction"
##D   
## End(Not run)



