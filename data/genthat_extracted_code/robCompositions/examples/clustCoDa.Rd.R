library(robCompositions)


### Name: clustCoDa
### Title: Cluster analysis for compositional data
### Aliases: clustCoDa plot.clustCoDa plot.clustCoDa
### Keywords: multivariate

### ** Examples

data(expenditures)
x <- expenditures
rr <- clustCoDa(x, k=6, scale = "robust", transformation = "pivotCoord")
rr2 <- clustCoDa(x, k=6, distMethod = "Aitchison", scale = "none", 
                 transformation = "identity")
rr3 <- clustCoDa(x, k=6, distMethod = "Aitchison", method = "single",
                 transformation = "identity", scale = "none")
plot(rr)
plot(rr, normalized = TRUE)
plot(rr, normalized = TRUE, which.plot = "partMeans")



