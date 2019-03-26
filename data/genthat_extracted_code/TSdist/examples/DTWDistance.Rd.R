library(TSdist)


### Name: DTWDistance
### Title: Dynamic Time Warping distance.
### Aliases: DTWDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the TSdist 
# package 


data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the basic DTW distance for two series of different length.

DTWDistance(example.series3, example.series4)

# Calculate the DTW distance for two series of different length
# with a sakoechiba window of size 30:

DTWDistance(example.series3, example.series4, window.type="sakoechiba", window.size=30)

# Calculate the DTW distance for two series of different length
# with an assymetric step pattern

DTWDistance(example.series3, example.series4, step.pattern=asymmetric)




