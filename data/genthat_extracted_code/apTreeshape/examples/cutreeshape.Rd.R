library(apTreeshape)


### Name: cutreeshape
### Title: Cut objects of class "treeshape"
### Aliases: cutreeshape
### Keywords: manip

### ** Examples


## Data set provided with the library. Type help(cytochromc) for more infos.
data(carnivora.treeshape)  
data(hivtree.treeshape)

## Examples of "bottom" cutting:
bottom.tree=cutreeshape(carnivora.treeshape, 3, "bottom")
plot(carnivora.treeshape, bottom.tree)
bottom.tree=cutreeshape(carnivora.treeshape, 8, "bottom")
plot(carnivora.treeshape, bottom.tree)
  
## Examples of "top" pruning:
top.tree=cutreeshape(hivtree.treeshape, 158, "top")
plot(hivtree.treeshape, top.tree)



