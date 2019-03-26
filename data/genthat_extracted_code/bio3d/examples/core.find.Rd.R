library(bio3d)


### Name: core.find
### Title: Identification of Invariant Core Positions
### Aliases: core.find core.find.default core.find.pdbs core.find.pdb
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
##D #core.inds <- print(core, vol=1)
##D core.inds <- print(core, vol=0.5)
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
## End(Not run)

## Not run: 
##D ##-- Run core.find() on a multimodel PDB file
##D pdb <- read.pdb('1d1d', multi=TRUE)
##D core <- core.find(pdb)
##D 
##D ##-- Run core.find() on a trajectory
##D trtfile <- system.file("examples/hivp.dcd", package="bio3d")
##D trj <- read.dcd(trtfile)
##D 
##D ## Read the starting PDB file to determine atom correspondence
##D pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
##D pdb <- read.pdb(pdbfile)
##D 
##D ## select calpha coords from a manageable number of frames
##D ca.ind <- atom.select(pdb, "calpha")$xyz
##D frames <- seq(1, nrow(trj), by=10)
##D 
##D core <- core.find( trj[frames, ca.ind], write.pdbs=TRUE )
##D 
##D ## have a look at the various cores "vmd -m core_pruned/*.pdb"
##D 
##D ## Lets use a 6A^3 core cutoff
##D inds <- print(core, vol=6)
##D write.pdb(xyz=pdb$xyz[inds$xyz],resno=pdb$atom[inds$atom,"resno"], file="core.pdb")
##D 
##D 
##D ##- Fit trj onto starting structure based on core indices
##D xyz <- fit.xyz( fixed = pdb$xyz,
##D                mobile = trj,
##D                fixed.inds  = inds$xyz,
##D                mobile.inds = inds$xyz)
##D 
##D ##write.pdb(pdb=pdb, xyz=xyz, file="new_trj.pdb")
##D ##write.ncdf(xyz, "new_trj.nc")
##D 
## End(Not run)




