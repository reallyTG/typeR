library(bdlp)


### Name: generateData
### Title: Generate a dataset from a metadata object
### Aliases: generateData

### ** Examples

require(MASS)
m <- new("metadata.metric", 
         clusters = list(c1 = list(n = 25, mu = c(4,5), Sigma=diag(1,2)),
                         c2 = list(n = 25, mu = c(-1,-2), Sigma=diag(1,2))),
         genfunc = mvrnorm)
generateData(m)



