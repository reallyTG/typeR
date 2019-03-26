library(palaeoSig)


### Name: mat.h
### Title: MAT with minimum geographic distance for analogues
### Aliases: mat.h
### Keywords: multivariate

### ** Examples


require(fields)
data(arctic.env)
data(arctic.pollen)
arctic.dist <- rdist.earth(arctic.env[,c("Longitude", "Latitude")], miles=FALSE)


h0 <- mat.h(arctic.pollen, arctic.env$tjul, noanalogues = 10, arctic.dist, thresh=-1)
h100 <- mat.h(arctic.pollen, arctic.env$tjul, noanalogues = 10, arctic.dist, thresh=100)

cor(h0, arctic.env$tjul)
cor(h100, arctic.env$tjul)

sqrt(mean((h0 - arctic.env$tjul)^2))
sqrt(mean((h100 - arctic.env$tjul)^2))





