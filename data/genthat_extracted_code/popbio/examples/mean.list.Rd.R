library(popbio)


### Name: mean.list
### Title: Calculate mean matrix
### Aliases: mean.list
### Keywords: survey

### ** Examples

data(hudsonia)
mean(hudsonia)
## or
x <- matrix(unlist(hudsonia), ncol=length(hudsonia) )
matrix(rowMeans(x), 6, 6)



