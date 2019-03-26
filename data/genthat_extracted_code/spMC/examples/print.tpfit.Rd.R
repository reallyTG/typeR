library(spMC)


### Name: print.tpfit
### Title: Printing Model Parameters for One-dimensional Continuous Lag
###   Spatial MC
### Aliases: print.tpfit
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
MoPa <- tpfit(ACM$MAT5, ACM[, 1:3], c(0, 0, 1))

# Print results
print(MoPa)
## End(No test)


