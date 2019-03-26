library(ratematrix)


### Name: mergeSimmap
### Title: Merge two or more regimes of a 'simmap' tree
### Aliases: mergeSimmap

### ** Examples

## No test: 
library( phytools ) ## Need phytools for this example.
data(centrarchidae)
plot( centrarchidae$phy.map )
class( centrarchidae$phy.map )
## Now drop all regime information:
no.regime.phy <- mergeSimmap(centrarchidae$phy.map, drop.regimes=TRUE)
plot( no.regime.phy )
class( no.regime.phy )
## Create a new regime with three states:
dt <- c(rep( c("water","earth"), each=10 ), rep("fire", times=7))
names(dt) <- no.regime.phy$tip.label
map.phy <- phytools::make.simmap(tree=no.regime.phy, x=dt)
plot( map.phy )
## Merge two regimes:
merged.phy <- mergeSimmap(phy=map.phy, merge.regimes=c("water","earth"), new.regime="mud")
plot( merged.phy )
## End(No test)



