library(WhatIf)


### Name: whatif
### Title: Counterfactual Evaluation
### Aliases: whatif
### Keywords: htest models regression

### ** Examples

##  Create example data sets and counterfactuals
my.cfact <- matrix(rnorm(3*5), ncol = 5)
my.data <- matrix(rnorm(100*5), ncol = 5)

##  Evaluate counterfactuals
my.result <- whatif(data = my.data, cfact = my.cfact, mc.cores = 1)

##  Evaluate counterfactuals and supply own gower distances for 
##  cumulative frequency distributions
my.result <- whatif(cfact = my.cfact, data = my.data, 
                    freq = c(0, .25, .5, 1, 1.25, 1.5), mc.cores = 1)



