library(WhatIf)


### Name: summary.whatif
### Title: Summary of "whatif" Object
### Aliases: summary.whatif
### Keywords: print

### ** Examples

##  Create example data sets and counterfactuals
my.cfact <- matrix(rnorm(3*5), ncol = 5)
my.data <- matrix(rnorm(100*5), ncol = 5)

##  Evaluate counterfactuals
my.result <- whatif(data = my.data, cfact = my.cfact, mc.cores = 1)

##  Print summary
summary(my.result)



