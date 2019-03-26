library(LOST)


### Name: how.many.missing
### Title: Calculate the percentage of missing morphometric data
### Aliases: how.many.missing

### ** Examples

data(crocs)

## remove 30% of data points
croc.miss<-missing.data(crocs,0.3)

## should return 0.3
how.many.missing (croc.miss)




