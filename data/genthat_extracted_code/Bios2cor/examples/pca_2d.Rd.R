library(Bios2cor)


### Name: pca_2d
### Title: PCA projection on two dimensions
### Aliases: pca_2d
### Keywords: pca 2d

### ** Examples

  msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align)

  #Creating ENTROPY object
  entropy <- entropy(align)

  # Creating PCA structures for OMES method and storing in txt file
  omes <-omes$normalized
  pca <- centered_pca(omes, m= NULL, pc= NULL, dec_val= 5,eigenvalues_csv= NULL)
  pca_2d(pca, abs= 1, ord= 2, "pca_2d.png")
  



