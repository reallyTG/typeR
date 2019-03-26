library(vqtl)


### Name: scanonevar.boot
### Title: scanonevar.boot
### Aliases: scanonevar.boot

### ** Examples

set.seed(27599)
test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5), n.mar = 5), n.ind = 50)
sov <- scanonevar(cross = test.cross)




