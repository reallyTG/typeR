library(bio3d)


### Name: plot.bio3d
### Title: Plots with marginal SSE annotation
### Aliases: plot.bio3d plotb3
### Keywords: hplot

### ** Examples

## No test: 
# PDB server connection required - testing excluded

## Plot of B-factor values along with secondary structure from PDB
pdb <- read.pdb( "1bg2" )
bfac <- pdb$atom[pdb$calpha,"b"]
plot.bio3d(bfac, sse=pdb, ylab="B-factor", col="gray")
points(bfac, typ="l")
## End(No test)

## Not run: 
##D ## Use PDB residue numbers and include short secondary structure elements
##D plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=pdb, resno=pdb, ylab="B-factor",
##D   typ="l", lwd=1.5, col="blue", sse.min.length=0)
##D 
##D 
##D ## Calculate secondary structure using stride() or dssp()
##D #sse <- stride(pdb)
##D sse <- dssp(pdb)
##D 
##D ## Plot of B-factor values along with calculated secondary structure
##D plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=sse, ylab="B-factor", typ="l",
##D col="blue", lwd=2)
## End(Not run)

## No test: 
# PDB server connection required - testing excluded

## Plot 'aligned' data respecting gap positions
attach(transducin)

pdb = read.pdb("1tnd") ## Reference PDB see: pdbs$id[1]
pdb = trim.pdb(pdb, inds=atom.select(pdb, chain="A"))

## Plot of B-factor values with gaps
plot.bio3d(pdbs$b, resno=pdb, sse=pdb, ylab="B-factor")

## Plot of B-factor values after removing all gaps 
plot.bio3d(pdbs$b, rm.gaps=TRUE, resno = pdb, sse=pdb, ylab="B-factor")

detach(transducin)
## End(No test)

## Fancy secondary structure elements
##plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=pdb, ssetype="fancy")
## Currently not implemented



