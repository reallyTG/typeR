library(XMRF)


### Name: XMRF.Sim
### Title: Generate simulated data from XMRF models
### Aliases: XMRF.Sim

### ** Examples

library(XMRF)

# simulate scale-free network and data of multivariate Poisson for LPGM
sim <- XMRF.Sim(n=100, p=20, model="LPGM", graph.type="scale-free")
hist(sim$X)
plotNet(sim$B)

# simulate hub network and data of multivariate Gaussian for GGM
sim <- XMRF.Sim(n=100, p=20, model="GGM", graph.type="hub")
hist(sim$X)
plotNet(sim$B)

# simulate hub network and data of multivariate bionomial for ISM
sim <- XMRF.Sim(n=100, p=15, model="ISM", graph.type="hub")
hist(sim$X)
plotNet(sim$B)




