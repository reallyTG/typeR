library(HSAUR2)


### Name: bladdercancer
### Title: Bladder Cancer Data
### Aliases: bladdercancer
### Keywords: datasets

### ** Examples


  data("bladdercancer", package = "HSAUR2")
  mosaicplot(xtabs(~ number + tumorsize, data = bladdercancer))




