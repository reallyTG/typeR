library(ifultools)


### Name: aggregateData
### Title: Time series aggregation
### Aliases: aggregateData
### Keywords: utilities

### ** Examples

## Group a simple series into blocks containing 8 
## elements, and take the mean of each block. 
## Each block is lagged by 3 elements 
aggregateData(1:30, by=3, FUN=mean, moving=8)



