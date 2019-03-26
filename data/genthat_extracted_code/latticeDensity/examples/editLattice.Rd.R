library(latticeDensity)


### Name: editLattice
### Title: Add or remove links in the lattice
### Aliases: editLattice

### ** Examples

## Not run: 
##D plot.new()
##D data(polygon1)
##D nodeFillingOutput = nodeFilling(poly=polygon1, node_spacing=0.03)
##D plot(nodeFillingOutput)
##D formLatticeOutput = formLattice(nodeFillingOutput)
##D plot(formLatticeOutput)
##D formLatticeOutput = editLattice(formLatticeOutput)
##D #
##D #  Paste the code above into R, then do the editing before
##D #  pasting the code below into R.
##D #
##D Pointdata = splancs::csr(polygon1,20)
##D densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata,
##D                   k=150,intensity=FALSE, sparse = TRUE)
##D plot(densityOut)
## End(Not run)



