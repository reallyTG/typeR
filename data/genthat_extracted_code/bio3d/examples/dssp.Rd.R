library(bio3d)


### Name: dssp
### Title: Secondary Structure Analysis with DSSP or STRIDE
### Aliases: dssp dssp.pdb dssp.pdbs dssp.xyz stride print.sse
### Keywords: utilities

### ** Examples

## Not run: 
##D ##- PDB example
##D # Read a PDB file
##D pdb <- read.pdb("1bg2")
##D sse <- dssp(pdb)
##D sse2 <- stride(pdb)
##D 
##D ## Short summary
##D sse
##D sse2
##D 
##D # Helix data
##D sse$helix
##D 
##D # Precent SSE content
##D sum(sse$helix$length)/sum(pdb$calpha) * 100
##D sum(sse$sheet$length)/sum(pdb$calpha) * 100
##D 
##D 
##D 
##D ##- PDBs example
##D aln  <- read.fasta( system.file("examples/kif1a.fa",package="bio3d") )
##D pdbs <- read.fasta.pdb( aln )
##D 
##D ## Aligned PDB defined secondary structure
##D pdbs$sse
##D 
##D ## Aligned DSSP defined secondary structure 
##D sse <- dssp(pdbs)
##D 
##D 
##D ##- XYZ Trajectory
##D pdb <- read.pdb("2mda", multi=TRUE)
##D dssp.xyz(pdb$xyz, pdb)
##D 
##D ## Note. for large MD trajectories you may want to skip some frames, e.g.
##D xyz <- rbind(pdb$xyz, pdb$xyz)       ## dummy trajectory
##D frames <- seq(1, to=nrow(xyz), by=4) ## frame numbers to examine
##D ss <- dssp.xyz(xyz[frames, ], pdb)      ## matrix of sse frame x residue
##D 
## End(Not run)



