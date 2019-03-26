library(Bios2cor)


### Name: xyz2torsion
### Title: Convert Cartesian Coordinates to Torsion Angles
### Aliases: xyz2torsion
### Keywords: utilities

### ** Examples

  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")
  
  pdb <- read.pdb(pdb)
  trj <- read.dcd(trj)
 
  #Selecting only "CA" atoms
  ca.inds <- atom.select(pdb, elety = "CA")

  #Getting xyz coordinates using fit.xyz form bio3d package
  xyz <- fit.xyz(fixed = pdb$xyz, mobile = trj,fixed.inds=ca.inds$xyz,mobile.inds=ca.inds$xyz)
 
  frames <- seq(from= 1, to= 40, by= 2)
  
  #Creating torsion object for side chains using xyz2torsion function from bio3d package
  tor <- xyz2torsion(pdb, xyz[frames,], tbl = "sidechain", ncore= 1)



