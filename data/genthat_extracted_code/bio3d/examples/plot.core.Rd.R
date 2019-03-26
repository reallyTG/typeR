library(bio3d)


### Name: plot.core
### Title: Plot Core Fitting Progress
### Aliases: plot.core
### Keywords: hplot

### ** Examples

## Not run: 
##D 
##D ##-- Generate a small kinesin alignment and read corresponding structures
##D pdbfiles <- get.pdb(c("1bg2","2ncd","1i6i","1i5s"), URLonly=TRUE)
##D pdbs <- pdbaln(pdbfiles)
##D 
##D ##-- Find 'core' positions
##D core <- core.find(pdbs)
##D plot(core)
##D 
##D ##-- Fit on these relatively invarient subset of positions 
##D core.inds <- print(core)
##D xyz <- pdbfit(pdbs, core.inds, outpath="corefit_structures")
##D 
##D ##-- Compare to fitting on all equivalent positions
##D xyz2 <- pdbfit(pdbs)
##D 
##D ## Note that overall RMSD will be higher but RMSF will
##D ##  be lower in core regions, which may equate to a
##D ##  'better fit' for certain applications
##D gaps <- gap.inspect(pdbs$xyz)
##D rmsd(xyz[,gaps$f.inds])
##D rmsd(xyz2[,gaps$f.inds])
##D 
##D plot(rmsf(xyz[,gaps$f.inds]), typ="l", col="blue", ylim=c(0,9))
##D points(rmsf(xyz2[,gaps$f.inds]), typ="l", col="red")
##D 
## End(Not run)




