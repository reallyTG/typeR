library(PepPrep)


### Name: compHomToPepFasta
### Title: Comparison of proteins and creating homologous peptides workflow
### Aliases: compHomToPepFasta

### ** Examples

#load data and set arguments

#Uniprot proteom FASTA databases 
#(just a small example with two proteins each)
path_o1 <- system.file("extdata", "ExampleHumanProt.fasta", package="PepPrep")
path_o2 <- system.file("extdata", "ExampleMouseProt.fasta", package="PepPrep")

#where to write the result and how to formate
path <- paste0(getwd(), "/myTest_compHomToPep.fasta")
width <- 60

#call workflow
test <- compHomToPepFasta(path_o1, path_o2, path, width)
test <- compHomToPepFasta(path_o1, path_o2, path, width, intermediate=TRUE)



