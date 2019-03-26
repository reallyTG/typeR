library(TSdist)


### Name: NCDDistance
### Title: Normalized Compression based distance
### Aliases: NCDDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 respectively. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the normalized compression based distance between the two series 
# using default parameter.

NCDDistance(example.series3, example.series4)




