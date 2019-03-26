library(PwrGSD)


### Name: SCtoBdry
### Title: Converts a stochastic curtailment boundary (conditional type I
###   or II error probability) into a (efficacy or futility) boundary on
###   the standardized Z scale
### Aliases: SCtoBdry
### Keywords: htest design

### ** Examples


  ## Here we show how to convert a stochastic curtailment procedure for
  ## futility into a futility boundary on the standard normal scale
  library(PwrGSD)

  ## Values of the information fraction at interim analyses --
  ## the sequence does not have to include the last analysis
  frac <- c(0.16, 0.32, 0.54, 0.83, 1.0)

  ## values drift at interim analyses corresponding to values of
  ## frac given above
  drift <- c(0.69, 1.09, 1.54, 2.08, 2.35)

  ## value of the drift at the final analysis (from the design or
  ## projected
  drift.end <- drift[5]

  ## value of the efficacy boundary at the final analysis 
  be.end <- 1.69

  ## stochastic curtailment threshhold probability -- if the probability of rejecting the
  ## null hypothesis by the scheduled end of the trial, under the alternative hypothesis,
  ## and conditional upon the current value of the statistic, is not greater than
  ## prob.thresh, then stop for futility.
  prob.thresh <- 0.90

  ## computes equivalent futility boundary points on the standard normal scale
  SCtoBdry(prob.thresh, frac=frac, be.end=be.end, drift=drift, drift.end=drift.end)



