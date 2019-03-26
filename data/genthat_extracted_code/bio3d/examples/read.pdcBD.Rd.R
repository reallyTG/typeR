library(bio3d)


### Name: read.pdcBD
### Title: Read PQR output from pdcBD File
### Aliases: read.pdcBD
### Keywords: IO

### ** Examples

## No test: 
# PDB server connection required - testing excluded

# Read a PDB file
pdb <- read.pdb( "1bg2" )
  
# Print data for the first atom
pdb$atom[1,]
# Look at the first het atom
pdb$het[1,]
# Print some coordinate data
pdb$atom[1:20, c("x","y","z")]

# Print C-alpha coordinates (can also use 'atom.select')
##pdb$xyz[pdb$calpha, c("resid","x","y","z")]

# Print SSE data (for helix and sheet)
pdb$helix
pdb$sheet$start
  
# Print SEQRES data
pdb$seqres

# Renumber residues 
nums <- as.numeric(pdb$atom[,"resno"])
pdb$atom[,"resno"] <- nums - (nums[1] - 1)

# Write out renumbered PDB file
#write.pdb(pdb=pdb,file="eg.pdb")
## End(No test)



