library(Bios2cor)


### Name: ang_evo_graph
### Title: Angle evolution graphs
### Aliases: ang_evo_graph
### Keywords: graph top angle trajectory

### ** Examples
  
  #Reading pdb file
  pdb <- system.file("rotamer/toy_coordinates.pdb", package= "Bios2cor")
  trj <- system.file("rotamer/toy_dynamics.dcd", package= "Bios2cor")
  
   
  #output file
  filepath <- "angles.pdf"
  
  #Calculating dynamic data (dihedral angles)
  wanted_frames <- seq(from= 1, to= 40, by= 2)
  dynamic_struct <- dynamic_struct(pdb, trj, wanted_frames)

  wanted_residues <- c("H","N","Q","F","Y","W")
  
    
  dihed_corr <- rotamer_circular(dynamic_struct, wanted_residues)
  dihed_corr <- dihed_corr$normalized
  
  #Select positions of interest (calculated from the "corr_contact" function or list)
  top_angles <- corr_contact(dihed_corr, top= 25, "contact_file.txt","top_scores.txt")
  my_angles <- unlist(top_angles$positions)
  
  #Creating ang_evol graph
  evol_angles <- ang_evo_graph(dynamic_struct, my_angles, filepath)



