library(Bios2cor)


### Name: rotamer_circular
### Title: Circular correlation
### Aliases: rotamer_circular
### Keywords: circular correlation protein

### ** Examples

  #Reading pdb file
  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")

  #conversion_file <- system.file("rotamer/dynameomics_rotameres.csv", package= "Bios2cor")

  wanted_residues <- c("H","N","Q","F","Y","W")
  
  wanted_frames <- seq(from= 1, to= 40, by= 2)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)
    
  dihed_corr <- rotamer_circular(dynamic_struct, wanted_residues)



