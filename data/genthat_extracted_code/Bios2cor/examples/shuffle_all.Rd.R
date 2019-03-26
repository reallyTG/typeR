library(Bios2cor)


### Name: shuffle_all
### Title: Amino acids shuffle
### Aliases: shuffle_all
### Keywords: shuffle align correlation

### ** Examples

  #Importing sequences alignment
  align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Shuffling alignment
  corr <- shuffle_all(align, method = "OMES", fileHelix= NULL, gap_val= 0.8, z_score= TRUE,
        nb_iterations= 3)



