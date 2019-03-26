library(TSdist)


### Name: ARMahDistance
### Title: Model-based Dissimilarity Proposed by Maharaj (1996, 2000)
### Aliases: ARMahDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the 
# TSdist package obtained from an ARIMA(3,0,2) process. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the ar.mah distance between the two series using
# the default parameters. 

ARMahDistance(example.series3, example.series4)

# The p-value is almost 1, which indicates that the two series come from the same 
# ARMA process. 




