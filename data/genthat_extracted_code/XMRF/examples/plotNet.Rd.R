library(XMRF)


### Name: plotNet
### Title: Plot Network
### Aliases: plotNet

### ** Examples

library(XMRF)
n = 200
p = 30
sim <- XMRF.Sim(n=n, p=p, model="LPGM", graph.type="scale-free")
ml = plotNet(sim$B)



