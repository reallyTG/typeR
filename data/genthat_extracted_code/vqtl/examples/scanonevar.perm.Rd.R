library(vqtl)


### Name: scanonevar.perm
### Title: scanonevar.perm
### Aliases: scanonevar.perm

### ** Examples

set.seed(27599)
test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5), n.mar = 5), n.ind = 50)
scanonevar(cross = test.cross)




