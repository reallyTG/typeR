library(HKprocess)


### Name: lssd
### Title: LSSD estimation for the HKp parameters.
### Aliases: lssd
### Keywords: ts

### ** Examples

# Estimate the parameters for the Nile time series.

lssd(data = Nile,k1 = floor(length(Nile)/10),p = 2)



