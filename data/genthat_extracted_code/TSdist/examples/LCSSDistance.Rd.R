library(TSdist)


### Name: LCSSDistance
### Title: Longest Common Subsequence distance for Real Sequences.
### Aliases: LCSSDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the TSdist 
# package. 


data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the LCSS distance for two series of different length
# with no windowing constraint:

LCSSDistance(example.series3, example.series4, epsilon=0.1)

# Calculate the LCSS distance for two series of different length
# with a window of size 30:

LCSSDistance(example.series3, example.series4, epsilon=0.1, sigma=30)




