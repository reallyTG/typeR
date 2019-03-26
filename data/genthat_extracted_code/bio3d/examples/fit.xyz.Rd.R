library(bio3d)


### Name: fit.xyz
### Title: Coordinate Superposition
### Aliases: fit.xyz rot.lsq
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

##--- Read an alignment & Fit aligned structures
aln  <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))
pdbs <- read.fasta.pdb(aln)

gaps <- gap.inspect(pdbs$xyz)

xyz <- fit.xyz( fixed  = pdbs$xyz[1,],
               mobile = pdbs$xyz,
               fixed.inds  = gaps$f.inds,
               mobile.inds = gaps$f.inds )

#rmsd( xyz[, gaps$f.inds] )
#rmsd( pdbs$xyz[, gaps$f.inds] )

##-- Superpose again this time outputing PDBs
xyz <- fit.xyz( fixed = pdbs$xyz[1,],
               mobile = pdbs,
               fixed.inds  = gaps$f.inds,
               mobile.inds = gaps$f.inds,
               outpath = "rough_fit",
               full.pdbs = TRUE)

##--- Fit two PDBs
A <- read.pdb("1bg2")
A.ind <- atom.select(A, resno=c(256:269), elety='CA')

B <- read.pdb("2kin")
B.ind <- atom.select(B, resno=c(257:270), elety='CA')

xyz <- fit.xyz(fixed=A$xyz, mobile=B$xyz,
               fixed.inds=A.ind$xyz,
               mobile.inds=B.ind$xyz)

# Write out moved PDB
C <- B; C$xyz = xyz
write.pdb(pdb=C, file = "moved.pdb")
## End(No test)




