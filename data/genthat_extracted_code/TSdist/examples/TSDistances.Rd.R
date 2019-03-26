library(TSdist)


### Name: TSDistances
### Title: TSdist distance computation.
### Aliases: TSDistances

### ** Examples


# The objects zoo.series1 and zoo.series2 are two 
# zoo objects that save two series of length 100. 

data(zoo.series1)
data(zoo.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# The distance calculation for these two series is done
# as follows:

TSDistances(zoo.series1, zoo.series2, distance="infnorm")
TSDistances(zoo.series1, zoo.series2, distance="cor", beta=3)
TSDistances(zoo.series1, zoo.series2, distance="dtw", sigma=20)






