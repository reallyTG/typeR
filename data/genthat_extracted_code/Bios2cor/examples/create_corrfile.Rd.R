library(Bios2cor)


### Name: create_corrfile
### Title: Creates a correlation file
### Aliases: create_corrfile
### Keywords: correlation

### ** Examples

  msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <-omes$normalized
  
  create_corrfile(omes, entropy= NULL, auto_pairing= FALSE, "corr_results.txt")



