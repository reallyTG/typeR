library(bio3d)


### Name: orient.pdb
### Title: Orient a PDB Structure
### Aliases: orient.pdb
### Keywords: manip

### ** Examples

## No test: 
# PDB server connection required - testing excluded

pdb <- read.pdb( "1bg2" )
xyz <- orient.pdb(pdb)
#write.pdb(pdb, xyz = xyz, file = "mov1.pdb")


# Based on C-alphas
inds <- atom.select(pdb, "calpha")
xyz  <- orient.pdb(pdb, atom.subset=inds$atom)
#write.pdb(pdb, xyz = xyz, file = "mov2.pdb")


# Based on a central Beta-strand
inds <- atom.select(pdb, resno=c(224:232), elety='CA')
xyz  <- orient.pdb(pdb, atom.subset=inds$atom)
#write.pdb(pdb, xyz = xyz, file = "mov3.pdb")
## End(No test)



