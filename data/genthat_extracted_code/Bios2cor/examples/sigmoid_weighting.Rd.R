library(Bios2cor)


### Name: sigmoid_weighting
### Title: Sigmoid weighting for each position
### Aliases: sigmoid_weighting
### Keywords: weighting entropy sigmoid

### ** Examples

  align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating ENTROPY object
  entropy <- entropy(align)
  
  filter <- sigmoid_weighting(entropy, L= 10, inf_pt= 0.1, stability= TRUE)



