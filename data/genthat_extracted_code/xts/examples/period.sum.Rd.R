library(xts)


### Name: period.sum
### Title: Calculate Sum By Period
### Aliases: period.sum
### Keywords: utilities

### ** Examples

period.sum(c(1,1,4,2,2,6,7,8,-1,20),c(0,3,5,8,10))

data(sample_matrix)
period.sum(sample_matrix[,1],endpoints(sample_matrix))
period.sum(as.xts(sample_matrix)[,1],endpoints(sample_matrix))



