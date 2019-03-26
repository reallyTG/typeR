library(Bios2cor)


### Name: create_pcafile
### Title: Creates a file of coordinates in PCA space
### Aliases: create_pcafile
### Keywords: pca coordinates correlation

### ** Examples

   msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <-omes$normalized

  pca <- centered_pca(omes, m = NULL, pc= NULL, dec_val= 5,eigenvalues_csv= NULL)
   
  create_pcafile(pca, entropy = NULL,"pca_results.txt",10,"pc1.txt","pc2.txt")
  



