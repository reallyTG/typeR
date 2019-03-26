library(bio3d)


### Name: rgyr
### Title: Radius of Gyration
### Aliases: rgyr
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

# -- Calculate Rog of single structure
pdb <- read.pdb("1bg2")
mass <- rep(12, length(pdb$xyz)/3)
mass[substr(pdb$atom[,"elety"], 1, 1) == "N"] <- 14
mass[substr(pdb$atom[,"elety"], 1, 1) == "H"] <- 1
mass[substr(pdb$atom[,"elety"], 1, 1) == "O"] <- 16 
mass[substr(pdb$atom[,"elety"], 1, 1) == "S"] <- 32

rgyr(pdb, mass)
## End(No test)

## Not run: 
##D # -- Calculate Rog of a trajectory
##D xyz <- read.dcd(system.file("examples/hivp.dcd", package="bio3d"))
##D rg <- rgyr(xyz)
##D rg[1:10]
##D 
## End(Not run)



