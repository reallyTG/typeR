library(phyclust)


### Name: rescale.rooted.tree
### Title: Rescale a Rooted Tree's Height
### Aliases: rescale.rooted.tree
### Keywords: simulation

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D ret.ms <- ms(5, 1, opts = paste("-T", sep = " "))
##D tree.ms <- read.tree(text = ret.ms[3])
##D get.rooted.tree.height(tree.ms)
##D 
##D tree.scaled <- rescale.rooted.tree(tree.ms, scale.height = 2)
##D get.rooted.tree.height(tree.scaled)
## End(Not run)



