library(TSdist)


### Name: MindistSaxDistance
### Title: Symbolic Aggregate Aproximation based dissimilarity
### Aliases: MindistSaxDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 respectively. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the mindist.sax distance between the two series using
# 20 equal sized windows for each series. The rest of the parameters
# are left in their default mode.

MindistSaxDistance(example.series3, example.series4, w=20)




