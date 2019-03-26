# test simCluster with spheres

library(simLife)
library(unfoldr)

library(parallel)
options(simLife.mc=2L)

theta <- list("size"=list(0.1))
box <- list("xrange"=c(0,3),"yrange"=c(0,3),"zrange"=c(0,9))

S <- simPoissonSystem(theta,lam=15,size="const",
		box=box,type="spheres",pl=1,label="P")

# rsa
S2 <- rsa(S,verbose=TRUE)

# project some spheres
id <- c(1,5,9,32,10)

# get matrix of border points of sphere projections
P <- getSphereProjection(S2[id],draw=FALSE)

# densify with radius 0.35 based on hardcore particle system
CL <- simPoissonSystem(list(size=list(0.35)),lam=0.1,size="const",box=box,
		type="spheres",pl=1,label="P")

# construct cluster objects
CLUST <- simCluster(S2, CL, verbose=TRUE)

# densify
ctrl <- list(threshold.stop=0.01, max.call=100, verbose=FALSE)
RET <- densifyCluster(S2, CLUST, ctrl, weight=100)
RET[[length(RET)]]

