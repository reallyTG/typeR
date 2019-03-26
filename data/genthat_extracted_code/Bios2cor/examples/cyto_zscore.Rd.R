library(Bios2cor)


### Name: cyto_zscore
### Title: Creation of a Z-score file in Cytoscape format
### Aliases: cyto_zscore
### Keywords: cytoscape correlation

### ** Examples

   align <- import.msf(system.file("msa/toy_align.msf", package = "Bios2cor"))

  #Creating OMES object and writing Z-scores in cytoscape format
  omes <- omes(align)
  
  results <- cyto_zscore(omes, contact = NULL, "cyto_Zscore.txt")



