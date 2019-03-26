library(TeachingDemos)


### Name: tree.demo
### Title: Interactively demonstrate regression trees
### Aliases: tree.demo
### Keywords: dynamic models

### ** Examples

if(interactive()){
data('ethanol', package='lattice')
print(with(ethanol, tree.demo(E,NOx)))
}



