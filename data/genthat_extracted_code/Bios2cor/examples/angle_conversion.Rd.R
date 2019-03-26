library(Bios2cor)


### Name: angle_conversion
### Title: Conversion of dihedral angles to rotamers
### Aliases: angle_conversion
### Keywords: conversion angle trajectory protein

### ** Examples

  #Reading pdb and dcd files
  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")
 
  #Reading conversion file
  conversion_file <- system.file("rotamer/dynameomics_rotameres.csv", package= "Bios2cor")

  #Creating angle_conversion object
  wanted_frames <- seq(from= 1, to= 40, by= 2)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)
  
  my_rotamers <- angle_conversion(dynamic_struct, conversion_file)
  



