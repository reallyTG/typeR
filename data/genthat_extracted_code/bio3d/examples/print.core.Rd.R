library(bio3d)


### Name: print.core
### Title: Printing Core Positions and Returning Indices
### Aliases: print.core
### Keywords: utilities

### ** Examples


## Not run: 
##D ##-- Generate a small kinesin alignment and read corresponding structures
##D pdbfiles <- get.pdb(c("1bg2","2ncd","1i6i","1i5s"), URLonly=TRUE)
##D pdbs <- pdbaln(pdbfiles)
##D 
##D ##-- Find 'core' positions
##D core <- core.find(pdbs)
##D plot(core)
##D 
##D ##-- Fit on these relatively invarient subset of positions 
##D core.inds <- print(core, vol=0.5)
##D 
##D print(core, vol=0.7)
##D print(core, vol=1.0)
##D 
## End(Not run)



