library(TSdist)


### Name: example.database2
### Title: Example synthetic database with series belonging to different
###   classes.
### Aliases: example.database2
### Keywords: datasets

### ** Examples


data(example.database2);


##  The "data" element of the list contains the time series, set in a row-wise format.

plot(example.database2$data)[1,]

##  The "classes" element in example.database2 contains the classes of the series: 

example.database2$classes



