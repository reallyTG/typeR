library(TSdist)


### Name: LBKeoghDistance
### Title: LB_Keogh for DTW.
### Aliases: LBKeoghDistance

### ** Examples

# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)

# Calculate the LB_Keogh distance measure for these two series
# with a window of band of width 11:

LBKeoghDistance(example.series1, example.series2, window.size=11)






