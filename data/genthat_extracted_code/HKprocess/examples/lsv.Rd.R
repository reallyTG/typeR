library(HKprocess)


### Name: lsv
### Title: LSV estimation for the HKp parameters.
### Aliases: lsv
### Keywords: ts

### ** Examples

# Estimate the parameters for the Nile time series.

lsv(data = Nile,k1 = floor(length(Nile)/10),p = 6,q = 50)



