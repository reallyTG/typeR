library(bio3d)


### Name: write.pqr
### Title: Write PQR Format Coordinate File
### Aliases: write.pqr
### Keywords: IO

### ** Examples

## No test: 
# PDB server connection required - testing excluded

# Read a PDB file
pdb <- read.pdb( "1bg2" )

# Write out in PQR format 
outfile = file.path(tempdir(), "eg.pqr")
write.pqr(pdb=pdb, file = outfile)

invisible( cat("\nSee the output file:", outfile, sep = "\n") )

## End(No test)



