library(spacodiR)


### Name: match.spacodi.data
### Title: pruning a tree to match datasets used in SPACoDi
### Aliases: match.spacodi.data

### ** Examples

# load a species-by-plots matrix, along with a tree
data(sp.example)
attributes(sp.example)
attach(sp.example)
spl
phy
trt

# prune out undersampled plots
spl[,2]=0
match.spacodi.data(spl) -> sp.plot.new
sp.plot.new


# match datasets where sp.traits is smaller than the remainder
match.spacodi.data(sp.plot=spl, phy=phy, sp.traits=trt[1:6,])
							



