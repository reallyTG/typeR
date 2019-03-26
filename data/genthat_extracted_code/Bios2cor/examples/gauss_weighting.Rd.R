library(Bios2cor)


### Name: gauss_weighting
### Title: Creation of a gaussian weighting filter for each element
### Aliases: gauss_weighting
### Keywords: weighting entropy gauss

### ** Examples

 align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating ENTROPY object
  entropy <- entropy(align)
  
  filter <- gauss_weighting(entropy, L= 0.1, lambda= 1)
  



