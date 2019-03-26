library(Bios2cor)


### Name: rotamer_mip
### Title: MIP(Mutual Information Product) function applied to rotamers in
###   molecular dynamics simulations
### Aliases: rotamer_mip
### Keywords: mip rotamer

### ** Examples

  #Calculating rotamers
  pdb <- system.file("rotamer/tiny_toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/tiny_toy_dynamics.dcd", package= "Bios2cor")

  conversion_file <- system.file("rotamer/dynameomics_rotameres.csv", package= "Bios2cor")

  wanted_residues <- c("H","N")
  
  wanted_frames <- seq(from= 5, to= 40, by= 15)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)
  
  my_angles <- angle_conversion(dynamic_struct, conversion_file)
  
  #Creating MIP object
  mip_corr <- rotamer_mip(dynamic_struct, my_angles, wanted_residues)



