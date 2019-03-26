library(phyclust)


### Name: as.star.tree
### Title: Coerce a Rooted Tree to a Star Tree in Class phylo
### Aliases: as.star.tree 'Class phylo'
### Keywords: programming

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D ret.ms <- ms(5, 1, opts = paste("-T", sep = " "))
##D tree.ms <- read.tree(text = ret.ms[3])
##D str(tree.ms)
##D (tree.star <- as.star.tree(tree.ms))
##D 
##D # Plot results
##D par(mfrow = c(1, 2))
##D plot(tree.ms, type = "u", main = "original tree")
##D plot(tree.star, type = "u", main = "as star tree")
## End(Not run)



