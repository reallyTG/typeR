library(phyclust)


### Name: plotnj
### Title: Plot an Unrooted Trees.
### Aliases: plotnj
### Keywords: plot

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D ret.ms <- ms(nsam = 24, opts = "-T -G 0.5")
##D tree.anc <- read.tree(text = ret.ms[3])
##D 
##D is.rooted(tree.anc)
##D tree.new <- as.star.tree(tree.anc)
##D X.class <- rep(1:6, each = 4)
##D 
##D par(mfrow = c(2, 2))
##D plotnj(tree.anc, X.class, type = "u", edge.width.class = 2,
##D        main = "unrooted tree")
##D plotnj(tree.new, X.class, type = "u", edge.width.class = 2,
##D        main = "star tree")
##D plotnj(tree.anc, X.class, type = "c", edge.width.class = 2,
##D        main = "unrooted tree in cladogram")
##D plotnj(tree.new, X.class, type = "r", edge.width.class = 2,
##D        main = "star tree in radial")
## End(Not run)



