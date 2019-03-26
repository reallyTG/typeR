library(TSdist)


### Name: SpecLLRDistance
### Title: General Spectral Dissimilarity Measure Using Local-Linear
###   Estima- tion of the Log-Spectra
### Aliases: SpecLLRDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the spec.isd distance between the two series using
# the default parameters. 

SpecLLRDistance(example.series1, example.series2)




