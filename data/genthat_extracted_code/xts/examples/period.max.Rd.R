library(xts)


### Name: period.max
### Title: Calculate Max By Period
### Aliases: period.max
### Keywords: utilities

### ** Examples

period.max(c(1,1,4,2,2,6,7,8,-1,20),c(0,3,5,8,10))

data(sample_matrix)
period.max(sample_matrix[,1],endpoints(sample_matrix))
period.max(as.xts(sample_matrix)[,1],endpoints(sample_matrix))



