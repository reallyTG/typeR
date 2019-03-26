library(capwire)


### Name: fitTirmPartition
### Title: Fit the Two Innate Rates Model After Partiioning Data
### Aliases: fitTirmPartition

### ** Examples

## Use dummy data set with a few individuals having very high capture counts
d <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,4,4,6,6,7,8,10,10,14,17,19,22,22,25)

data <- buildClassTable(d)

## Partition the data
## Fit the TIRM to the lower two classes obtained from partitioning data set

res <- fitTirmPartition(data=data, max.pop=200, n.boots.part=10)

res

## Compare population estimate from fitting TIRM 
## to partitioned data set to population estimate obtained from fitting all data

res.all <- fitTirm(data=data, max.pop=200)$ml.pop.size

res.all




