library(phyclust)


### Name: gen.equal.star.anc.dec
### Title: Generate Comprehensive Trees.
### Aliases: gen.equal.star.anc.dec
### Keywords: simulation

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D tree.K <- gen.equal.star.anc.dec(6, rep(3:5, 2),
##D                                  rate.f = 0.7)
##D X.class <- as.numeric(gsub("d(.).(.)", "\\1",
##D                            tree.K$equal.star$tip.label))
##D 
##D # Plot results
##D plotnj(tree.K$equal.star, X.class, type = "p",
##D        edge.width.class = 2, main = "equal.star")
##D axis(1)
## End(Not run)



