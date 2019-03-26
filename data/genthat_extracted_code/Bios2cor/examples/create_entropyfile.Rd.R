library(Bios2cor)


### Name: create_entropyfile
### Title: Stores entropy values
### Aliases: create_entropyfile
### Keywords: entropy

### ** Examples

   align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating ENTROPY object (as an example)
  entropy <- entropy(align)
  
  create_entropyfile(entropy, "results_entropy.txt")



