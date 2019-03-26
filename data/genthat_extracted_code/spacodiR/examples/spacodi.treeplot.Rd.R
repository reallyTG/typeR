library(spacodiR)


### Name: spacodi.treeplot
### Title: EXPERIMENTAL: plotting diversity turnover on trees
### Aliases: spacodi.treeplot

### ** Examples

data(sp.example)
attach(sp.example)

# plot PIst 
PI=spacodi.by.nodes(sp.plot=spl, sp.parm="PIst", phy=phy, return.all=TRUE, method="1s")
spacodi.treeplot(PI, phy, sig.plot=TRUE, add.id=FALSE)
spacodi.treeplot(PI, phy, sig.plot=FALSE, add.id=FALSE)





