library(Bios2cor)


### Name: create_network
### Title: Creates network structure of top elements
### Aliases: create_network
### Keywords: contact network

### ** Examples

  msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <-omes$normalized
   
  contact <- corr_contact(omes, top= 25, "contact_file.txt","top_scores.txt")

  create_network(contact, "network_file.pdf")
  



