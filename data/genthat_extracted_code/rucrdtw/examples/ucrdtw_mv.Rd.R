library(rucrdtw)


### Name: ucrdtw_mv
### Title: UCR DTW Algorithm matrix-vector method
### Aliases: ucrdtw_mv

### ** Examples

#load example data
data("synthetic_control")
query <- synthetic_control[5,]
#run query
ucrdtw_mv(synthetic_control, query, 0.05, byrow = TRUE)



