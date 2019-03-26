library(bdlp)


### Name: plot3dMetadata
### Title: 3d plot of a metric metadata object
### Aliases: plot3dMetadata

### ** Examples

require(MASS)
m <- new("metadata.metric", 
         clusters = list(c1 = list(n = 25, mu = c(4,5,4), Sigma=diag(1,3)),
                         c2 = list(n = 25, mu = c(-1,-2,-2), Sigma=diag(1,3))),
         genfunc = mvrnorm)
plot3dMetadata(m)



