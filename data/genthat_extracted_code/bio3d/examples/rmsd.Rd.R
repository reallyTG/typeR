library(bio3d)


### Name: rmsd
### Title: Root Mean Square Deviation
### Aliases: rmsd
### Keywords: utilities

### ** Examples

## No test: 
# Redundant testing excluded

# -- Calculate RMSD between two or more structures
aln <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))
pdbs <- read.fasta.pdb(aln)

# Gap positions
inds <- gap.inspect(pdbs$xyz)

# Superposition before pairwise RMSD 
rmsd(pdbs$xyz, fit=TRUE)

# RMSD between structure 1 and structures 2 and 3
rmsd(a=pdbs$xyz[1,], b=pdbs$xyz[2:3,], a.inds=inds$f.inds, b.inds=inds$f.inds, fit=TRUE)

# RMSD between structure 1 and all structures in alignment
rmsd(a=pdbs$xyz[1,], b=pdbs, a.inds=inds$f.inds, b.inds=inds$f.inds, fit=TRUE)

# RMSD without superposition
rmsd(pdbs$xyz)

## End(No test)




