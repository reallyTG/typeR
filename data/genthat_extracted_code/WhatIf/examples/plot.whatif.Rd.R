library(WhatIf)


### Name: plot.whatif
### Title: Plot Cumulative Frequencies of Distances for "whatif" Objects
### Aliases: plot.whatif
### Keywords: hplot

### ** Examples

##  Create example data sets and counterfactuals
my.cfact <- matrix(rnorm(3*5), ncol = 5)
my.data <- matrix(rnorm(100*5), ncol = 5)

##  Evaluate counterfactuals
my.result <- whatif(data = my.data, cfact = my.cfact, mc.cores = 1)

##  Plot cumulative frequencies for the first two counterfactuals (rows
##  1 and 2) in my.cfact
plot(my.result, type = "b", numcf = c(1, 2), mc.cores = 1)



