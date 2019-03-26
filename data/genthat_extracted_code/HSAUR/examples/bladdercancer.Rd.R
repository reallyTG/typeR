library(HSAUR)


### Name: bladdercancer
### Title: Bladder Cancer Data
### Aliases: bladdercancer
### Keywords: datasets

### ** Examples


  data("bladdercancer", package = "HSAUR")
  mosaicplot(xtabs(~ number + tumorsize, data = bladdercancer))




