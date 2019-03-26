library(surveillance)


### Name: twinSIR_profile
### Title: Profile Likelihood Computation and Confidence Intervals
### Aliases: profile.twinSIR plot.profile.twinSIR
### Keywords: htest methods optimize dplot

### ** Examples

if (surveillance.options("allExamples")) {
  data("foofit")
  prof <- profile(foofit, list(c(1,NA,NA,5), c(3,NA,NA,0), c(4, 0.5, 1.1, 10)))
  prof

  ## there is also a plot-method for "profile.twinSIR"
  plot(prof)
}



