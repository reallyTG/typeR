library(TSdist)


### Name: SpecISDDistance
### Title: Dissimilarity Based on the Integrated Squared Difference between
###   the Log-Spectra
### Aliases: SpecISDDistance

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

SpecISDDistance(example.series1, example.series2)




