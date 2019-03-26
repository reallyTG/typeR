library(parmigene)


### Name: mrnet
### Title: Maximum Relevance Minimum Redundancy
### Aliases: mrnet

### ** Examples

mat <- matrix(rnorm(1000), nrow=10)
mi  <- knnmi.all(mat)
grn <- mrnet(mi)



