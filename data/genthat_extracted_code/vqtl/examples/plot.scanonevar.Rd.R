library(vqtl)


### Name: plot.scanonevar
### Title: plot.scanonevar
### Aliases: plot.scanonevar

### ** Examples

set.seed(27599)
test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 3), n.mar = 5), n.ind = 50)
test.sov <- scanonevar(cross = test.cross)
plot(x = test.sov)




