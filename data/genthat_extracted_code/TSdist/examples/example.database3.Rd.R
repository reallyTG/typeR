library(TSdist)


### Name: example.database3
### Title: Example synthetic database with series belonging to different
###   classes.
### Aliases: example.database3
### Keywords: datasets

### ** Examples


data(example.database3);


##  The "data" element of the list contains the time series, set in a row-wise format.

plot(example.database3$data)[1,]

##  The "classes" element in example.database3 contains the classes of the series: 

example.database3$classes



