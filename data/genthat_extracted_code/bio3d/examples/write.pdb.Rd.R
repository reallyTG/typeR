library(bio3d)


### Name: write.pdb
### Title: Write PDB Format Coordinate File
### Aliases: write.pdb
### Keywords: IO

### ** Examples

## No test: 
# PDB server connection required - testing excluded

# Read a PDB file
pdb <- read.pdb( "1bg2" )

# Renumber residues
nums <- as.numeric(pdb$atom[,"resno"])
nums <- nums - (nums[1] - 1)

# Write out renumbered PDB file
outfile = file.path(tempdir(), "eg.pdb")
write.pdb(pdb=pdb, resno = nums, file = outfile)

invisible( cat("\nSee the output file:", outfile, sep = "\n") )
## End(No test)



