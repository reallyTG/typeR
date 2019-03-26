library(adiv)


### Name: distinctUltra
### Title: Ultrametric Tree-based Species' Originality
### Aliases: distinctUltra
### Keywords: models

### ** Examples

data(carni70, package = "adephylo")
tre <- read.tree(text=carni70$tre)
U <- distinctUltra(tre)
U.4d <- phylo4d(tre, as.matrix(U))
parmar <- par()$mar
par(mar=rep(.1,4))
table.phylo4d(U.4d, show.node=FALSE, symbol="squares", center=FALSE, scale=FALSE, cex.symbol=2)
par(mar=parmar)

## Not run: 
##D if(requireNamespace("phylosignal", quietly = TRUE)) {
##D dotplot.phylo4d(U.4d, center = FALSE, scale = FALSE)
##D }
## End(Not run)



