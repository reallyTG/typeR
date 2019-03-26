library(bio3d)


### Name: bwr.colors
### Title: Color Palettes
### Aliases: bwr.colors mono.colors
### Keywords: utilities

### ** Examples

## No test: 
# Redundant testing excluded

# Color a distance matrix
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
d <- dm(pdb,"calpha")

plot(d, color.palette=bwr.colors)

plot(d,
     resnum.1 = pdb$atom[pdb$calpha,"resno"],
     color.palette = mono.colors,
     xlab="Residue Number", ylab="Residue Number")
## End(No test)



