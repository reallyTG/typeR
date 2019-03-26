library(bio3d)


### Name: torsion.pdb
### Title: Calculate Mainchain and Sidechain Torsion/Dihedral Angles
### Aliases: torsion.pdb
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

##-- PDB torsion analysis
pdb <- read.pdb( "1bg2" )
tor <- torsion.pdb(pdb)
head(tor$tbl)

## basic Ramachandran plot
plot(tor$phi, tor$psi)

## torsion analysis of a single coordinate vector 
#inds <- atom.select(pdb,"calpha")
#tor.ca <- torsion.xyz(pdb$xyz[inds$xyz], atm.inc=1)

##-- Compare two PDBs to highlight interesting residues
aln <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))
m <- read.fasta.pdb(aln)
a <- torsion.xyz(m$xyz[1,],1)
b <- torsion.xyz(m$xyz[2,],1)
d <- wrap.tor(a-b)
plot(m$resno[1,],d, typ="h")
## End(No test)



