library(clusterSim)


### Name: data.Normalization
### Title: Types of variable (column) and object (row) normalization
###   formulas
### Aliases: data.Normalization
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_ratio)
z1 <- data.Normalization(data_ratio,type="n1",normalization="column")
z2 <- data.Normalization(data_ratio,type="n10",normalization="row")



