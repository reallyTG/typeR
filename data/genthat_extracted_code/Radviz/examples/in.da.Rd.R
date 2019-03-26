library(Radviz)


### Name: in.da
### Title: Optimization functions for Dimensional Anchors in Radviz
### Aliases: in.da rv.da

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
scaled <- apply(iris[,das],2,do.L)
sim.mat <- cosine(scaled)
in.da(S,sim.mat) # increases with better projections
rv.da(S,sim.mat) # decreases with better projections




