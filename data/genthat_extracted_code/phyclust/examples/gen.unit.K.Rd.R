library(phyclust)


### Name: gen.unit.K
### Title: Generate Comprehensive Trees.
### Aliases: gen.unit.K
### Keywords: simulation

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # For gen.unit.K()
##D set.seed(1234)
##D tree.K <- gen.unit.K(6, rep(3:5, 2),
##D                      rate.anc = 0.7, rate.dec = 1.1)
##D X.class <- as.numeric(gsub("d(.)(.*)", "\\1",
##D                            tree.K$org$tip.label))
##D 
##D # Plot results
##D par(mfrow = c(2, 2))
##D plotnj(tree.K$org, X.class, type = "p",
##D        edge.width.class = 2, main = "org")
##D axis(1)
##D plotnj(tree.K$equal, X.class, type = "p",
##D        edge.width.class = 2, main = "equal")
##D axis(1)
##D plotnj(tree.K$max, X.class, type = "p",
##D        edge.width.class = 2, main = "max")
##D axis(1)
##D plotnj(tree.K$star, X.class, type = "p",
##D        edge.width.class = 2, main = "star")
##D axis(1)
## End(Not run)



