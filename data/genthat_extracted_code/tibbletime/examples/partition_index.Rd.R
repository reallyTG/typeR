library(tibbletime)


### Name: partition_index
### Title: Partition an index vector into an integer vector representing
###   groups
### Aliases: partition_index

### ** Examples


data(FB)

partition_index(FB$date, '2 year')

dplyr::mutate(FB, partition_index = partition_index(date, '2 day'))




