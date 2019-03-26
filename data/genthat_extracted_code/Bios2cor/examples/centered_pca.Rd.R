library(Bios2cor)


### Name: centered_pca
### Title: Principal component analysis of a correlation/covariation matrix
### Aliases: centered_pca
### Keywords: pca weighting correlation

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
  #create_pcafile(pca, "pca_results.txt",10,"pc1.txt","pc2.txt")



