library(generalCorr)


### Name: get0outliers
### Title: Function to compute outliers and their count using Tukey method
###   using 1.5 times interquartile range (IQR) to define boundaries.
### Aliases: get0outliers

### ** Examples


set.seed(101);x=sample(1:100)[1:15];x[16]=150;x[17]=NA
get0outliers(x)#correctly identifies outlier=150





