library(TSdist)


### Name: TquestDistance
### Title: Tquest distance.
### Aliases: TquestDistance

### ** Examples

# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)


# Calculate the Tquest distance assuming even sampling:

TquestDistance(example.series1, example.series2, tau=2.5)

# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the TSdist 
# package.

data(example.series3)
data(example.series4)

# Calculate the Tquest distance for two series of different length:

TquestDistance(example.series3, example.series4, tau=2.5)




