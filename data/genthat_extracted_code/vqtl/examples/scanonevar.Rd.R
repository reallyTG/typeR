library(vqtl)


### Name: scanonevar
### Title: scanonevar
### Aliases: scanonevar

### ** Examples

set.seed(27599)
test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5), n.mar = 5), n.ind = 50)
scanonevar(cross = test.cross)




