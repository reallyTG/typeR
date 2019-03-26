library(Bios2cor)


### Name: delta_weighting
### Title: Creation of a Delta weighting filter for each element
### Aliases: delta_weighting
### Keywords: weighting entropy delta

### ** Examples

  align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating ENTROPY object
  entropy <- entropy(align)
  
  filter <- delta_weighting(entropy, Smin= 0.4, Smax= 0.6)
  



