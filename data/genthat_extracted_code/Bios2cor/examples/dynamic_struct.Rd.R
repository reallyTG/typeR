library(Bios2cor)


### Name: dynamic_struct
### Title: Creates the data structure for the analysis of side chain
###   dihedral angles
### Aliases: dynamic_struct
### Keywords: conversion angle trajectory protein

### ** Examples

   #Input files
  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")
  conversion_file <- system.file("rotamer/dynameomics_rotameres.csv", package= "Bios2cor")
  
  wanted_frames <- seq(from= 1, to= 40, by= 2)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)
  



