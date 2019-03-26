library(Bios2cor)


### Name: entropy_graph
### Title: Entropy graph
### Aliases: entropy_graph
### Keywords: entropy graph

### ** Examples

  msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <- omes$normalized
  
  #Creating ENTROPY object
  entropy <- entropy(align)
    
  #creating entropy graph
  entropy_graph(entropy, omes, filter = NULL, elite = 25, high = 275, csv = TRUE, 
          name = "entropy_graph.pdf")
  



