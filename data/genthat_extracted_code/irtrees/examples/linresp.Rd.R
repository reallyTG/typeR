library(irtrees)


### Name: linresp
### Title: Example Data: Linear Hierarchical Categories
### Aliases: linresp
### Keywords: datasets

### ** Examples

str(linresp)
mapping <- cbind(c(0,1,1), c(NA,0,1))
str(linrespT <- dendrify(linresp, mapping))



