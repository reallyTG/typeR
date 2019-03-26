library(motmot.2.0)


### Name: transformPhylo.sim
### Title: Phylogenetic tree transformations
### Aliases: transformPhylo.sim

### ** Examples

data(anolis.tree)
data(anolis.data)

# Simulate 10 sets of data with kappa=0.1 using the anolis tree
sim.dat1 <- transformPhylo.sim(phy=anolis.tree, n=10, model="kappa", kappa=0.1)

# Simulate 10 sets of data where rates and means differ between to the categories defined by "x"
x <- anolis.data$geo_ecomorph
names(x) <-  rownames(anolis.data)
sim.dat2 <- transformPhylo.sim(phy=anolis.tree, n=10, x=x, model="mixedRate", rate=c(1,1,2,4),
group.means=c(0,5,0,0))



