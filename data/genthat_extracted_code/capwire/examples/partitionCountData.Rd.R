library(capwire)


### Name: partitionCountData
### Title: Partition the Count Data
### Aliases: partitionCountData

### ** Examples

## Use dummy data set with a few individuals having very high capture counts
d <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,4,4,6,6,7,8,10,10,14,17,19,22,22,25)

data <- buildClassTable(d)

## Perform Partitioning Algorithm

part.data <- partitionCountData(data=data, n.boots.part=10, max.pop=500)

part.data




