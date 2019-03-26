library(HSAUR3)


### Name: bladdercancer
### Title: Bladder Cancer Data
### Aliases: bladdercancer
### Keywords: datasets

### ** Examples


  data("bladdercancer", package = "HSAUR3")
  mosaicplot(xtabs(~ number + tumorsize, data = bladdercancer))




