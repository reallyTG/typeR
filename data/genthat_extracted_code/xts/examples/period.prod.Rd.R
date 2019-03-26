library(xts)


### Name: period.prod
### Title: Calculate Product By Period
### Aliases: period.prod
### Keywords: utilities

### ** Examples

period.prod(c(1,1,4,2,2,6,7,8,-1,20),c(0,3,5,8,10))

data(sample_matrix)
period.prod(sample_matrix[,1],endpoints(sample_matrix))
period.prod(as.xts(sample_matrix)[,1],endpoints(sample_matrix))



