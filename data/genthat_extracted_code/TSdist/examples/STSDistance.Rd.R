library(TSdist)


### Name: STSDistance
### Title: Short time series distance (STS).
### Aliases: STSDistance

### ** Examples

# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)

# Calculate the STS distance assuming even sampling:

STSDistance(example.series1, example.series2)

# Calculate the STS distance providing an uneven sampling:

tx<-unique(c(seq(2, 175, 2), seq(7, 175, 7)))
tx <- tx[order(tx)]
ty <- tx
STSDistance(example.series1, example.series2, tx, ty)






