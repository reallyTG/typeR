library(Bios2cor)


### Name: rotamer_omes
### Title: OMES(Observed minus Expected Squared) function applied to
###   rotamers in molecular dynamics simulations
### Aliases: rotamer_omes
### Keywords: omes rotamer

### ** Examples

  #Calculating rotamers
  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")

  conversion_file <- system.file("rotamer/dynameomics_rotameres.csv", package= "Bios2cor")

  wanted_residues <- c("W")
  
  nb_frames_wanted <- 40
  wanted_frames <- seq(from= 5, to= nb_frames_wanted, by= 10)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)
  
  my_angles <- angle_conversion(dynamic_struct, conversion_file)
  
  #Creating OMES object
  omes_corr <- rotamer_omes(dynamic_struct, my_angles, wanted_residues, z_score= FALSE)



