library(BCA)


### Name: create.samples
### Title: Create a Sample Membership Character Variable
### Aliases: create.samples
### Keywords: misc

### ** Examples

  data(CCS)
  # Create a new set of samples with 40 percent in each of the estimation and
  # validation samples, and 20 percent in the holdout sample.
  CCS$Sample <- create.samples(CCS, est=0.4, val=0.4)
  


