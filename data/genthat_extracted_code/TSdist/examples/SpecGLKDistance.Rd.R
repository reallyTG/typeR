library(TSdist)


### Name: SpecGLKDistance
### Title: Dissimilarity based on the Generalized Likelihood Ratio Test
### Aliases: SpecGLKDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the ar.mah distance between the two series using
# the default parameters. 

SpecGLKDistance(example.series1, example.series2)




