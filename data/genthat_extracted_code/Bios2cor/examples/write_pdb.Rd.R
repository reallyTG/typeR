library(Bios2cor)


### Name: write_pdb
### Title: PDB and PML file creation for 3D representation of PCA analysis
### Aliases: write_pdb
### Keywords: pdb pml Pymol

### ** Examples

  align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating OMES object
  omes <- omes(align)
  omes <- omes$normalized
  
  # Creating PCA structures for OMES method 
  pca <- centered_pca(omes, m=NULL, pc= NULL, dec_val= 5,eigenvalues_csv= NULL)

  #Creating PDB and PML files (open PDB file with Pymol then "File > Run" PML file)
  indices <- c(1,2,3)
  write_pdb(pca, indices, "pdb_file.pdb", "pml_file.pml")



