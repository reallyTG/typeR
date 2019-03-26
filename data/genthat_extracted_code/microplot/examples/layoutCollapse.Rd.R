library(microplot)


### Name: layoutCollapse
### Title: Set the lattice 'par.settings' to remove all marginal space.
### Aliases: layoutHeightsCollapse layoutWidthsCollapse layoutCollapse
### Keywords: lattice

### ** Examples

## Not run: 
##D   lattice::trellis.par.get("layout.heights")
##D   lattice::trellis.par.get("layout.widths")
##D   layoutHeightsCollapse()
##D   layoutWidthsCollapse()
##D   layoutWidthsCollapse(axis.left=1)
##D 
##D   A <- lattice::xyplot(Sepal.Length ~ Sepal.Width | Species, data=iris)
##D 
##D   A                 ## one page with three panels
##D 
##D   layoutCollapse(A) ## three pages with one unlabeled panel on each
##D 
##D   layoutCollapse(A, ## one page with panels labeled by ylab
##D                  layout=c(1,3),
##D                  ylab=levels(iris$Species),
##D                  layout.heights=list(axis.bottom=1),
##D                  layout.widths=list(axis.left=1),
##D                  axis.line=list(col="green"))
## End(Not run)

## Please see the package documentation for a simple example in context.

## Please see the demos for more interesting examples.
## demo(package="microplot")



