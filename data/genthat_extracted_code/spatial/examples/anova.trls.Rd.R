library(spatial)


### Name: anova.trls
### Title: Anova tables for fitted trend surface objects
### Aliases: anova.trls anovalist.trls
### Keywords: spatial

### ** Examples

library(stats)
data(topo, package="MASS")
topo0 <- surf.ls(0, topo)
topo1 <- surf.ls(1, topo)
topo2 <- surf.ls(2, topo)
topo3 <- surf.ls(3, topo)
topo4 <- surf.ls(4, topo)
anova(topo0, topo1, topo2, topo3, topo4)
summary(topo4)



