library(bio3d)


### Name: write.mol2
### Title: Write MOL2 Format Coordinate File
### Aliases: write.mol2
### Keywords: IO

### ** Examples

## No test: 
# Read MOL2 file
mol <- read.mol2( system.file("examples/aspirin.mol2", package="bio3d") )

# Trim away H-atoms
mol <- trim(mol, "noh")

# Write new MOL2 file
#write.mol2(mol)
## End(No test)



