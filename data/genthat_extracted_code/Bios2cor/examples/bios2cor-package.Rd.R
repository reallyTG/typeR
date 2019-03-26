library(Bios2cor)


### Name: bios2cor-package
### Title: Correlation Analysis in Biological Sequences and Simulations
### Aliases: bios2cor-package bios2cor Bios2cor
### Keywords: correlation methods alignment

### ** Examples

  msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)

  #Creating ENTROPY object
  entropy <- entropy(align)

  #Creating weighting filter
  filter <- gauss_weighting(entropy, L= 0.1)
  
  # Creating PCA structures for OMES method and storing in txt file
  omes <-omes$normalized
  pca <- centered_pca(omes, m= filter, pc= NULL, dec_val= 5,eigenvalues_csv= NULL)
  
  



