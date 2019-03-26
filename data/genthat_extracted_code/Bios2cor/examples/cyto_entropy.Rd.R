library(Bios2cor)


### Name: cyto_entropy
### Title: Creation of a entropy file in Cytoscape format
### Aliases: cyto_entropy
### Keywords: cytoscape entropy

### ** Examples

  align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating ENTROPY object and writing results in cytoscape format
  entropy <- entropy(align)
  
  cyto_ent <- cyto_entropy(entropy, contact = NULL, "cyto_entropy.txt")



