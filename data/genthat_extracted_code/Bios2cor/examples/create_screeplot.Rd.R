library(Bios2cor)


### Name: create_screeplot
### Title: Creates PCA screeplot
### Aliases: create_screeplot
### Keywords: pca screeplot variance

### ** Examples

   msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <-omes$normalized

  pca <- centered_pca(omes, m = NULL, pc= NULL, dec_val= 5,eigenvalues_csv= NULL)

  create_screeplot(pca, pca_index= NULL, "screeplot.png")
  



