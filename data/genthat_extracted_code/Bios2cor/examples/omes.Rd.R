library(Bios2cor)


### Name: omes
### Title: OMES(Observed minus Expected Squared) function
### Aliases: omes
### Keywords: correlation homogeneity omes

### ** Examples

   msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  #omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <- omes(align)



