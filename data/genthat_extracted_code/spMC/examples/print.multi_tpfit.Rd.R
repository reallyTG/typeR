library(spMC)


### Name: print.multi_tpfit
### Title: Printing Model Parameters for Multidimensional Continuous Lag
###   Spatial MC
### Aliases: print.multi_tpfit
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# multidimensional MC models
MoPa <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Print results
print(MoPa)
## End(No test)


