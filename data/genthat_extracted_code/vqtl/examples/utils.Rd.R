library(vqtl)


### Name: is.scanonevar
### Title: is.scanonevar
### Aliases: is.scanonevar is.scanonevar.w.perms is.cross is.f2.cross
###   is.f2.cross is.cross.w.genoprobs

### ** Examples

is.scanonevar(x = 3)

test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 4), n.mar = 5))
test.cross <- qtl::calc.genoprob(cross = test.cross, step = 2)

x <- scanonevar(cross = test.cross)
is.scanonevar(x)

is.cross(3)
is.cross(qtl::sim.cross(map = qtl::sim.map()))

is.cross(3)
is.cross(qtl::sim.cross(map = qtl::sim.map()))

is.cross(3)
is.cross(qtl::sim.cross(map = qtl::sim.map()))

a <- qtl::sim.cross(map = qtl::sim.map())
is.cross.w.genoprobs(x = a)
b <- qtl::calc.genoprob(cross = a)
is.cross.w.genoprobs(x = b)




