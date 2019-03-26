library(bio3d)


### Name: read.dcd
### Title: Read CHARMM/X-PLOR/NAMD Binary DCD files
### Aliases: read.dcd
### Keywords: IO

### ** Examples

## No test: 
# Redundant testing excluded

##-- Read cell parameters from example trajectory file
trtfile <- system.file("examples/hivp.dcd", package="bio3d")
trj <- read.dcd(trtfile, cell = TRUE)
##-- Read coordinates from example trajectory file
trj <- read.dcd(trtfile)

## Read the starting PDB file to determine atom correspondence
pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
pdb <- read.pdb(pdbfile)

## select residues 24 to 27 and 85 to 90 in both chains
inds <- atom.select(pdb, resno=c(24:27,85:90), elety='CA')

## lsq fit of trj on pdb
xyz <- fit.xyz(pdb$xyz, trj, fixed.inds=inds$xyz, mobile.inds=inds$xyz)

##-- RMSD of trj frames from PDB
r1 <- rmsd(a=pdb, b=xyz)
## End(No test)

## Not run: 
##D # Pairwise RMSD of trj frames for positions 47 to 54
##D flap.inds <- atom.select(pdb, resno=c(47:54), elety='CA')
##D p <- rmsd(xyz[,flap.inds$xyz])
##D # plot highlighting flap opening?
##D plot.dmat(p, color.palette = mono.colors)
## End(Not run)




