library(xts)


### Name: period.min
### Title: Calculate Min By Period
### Aliases: period.min
### Keywords: utilities

### ** Examples

period.min(c(1,1,4,2,2,6,7,8,-1,20),c(0,3,5,8,10))

data(sample_matrix)
period.min(sample_matrix[,1],endpoints(sample_matrix))
period.min(as.xts(sample_matrix)[,1],endpoints(sample_matrix))



