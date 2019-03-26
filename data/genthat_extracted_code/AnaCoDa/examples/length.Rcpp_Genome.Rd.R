library(AnaCoDa)


### Name: length.Rcpp_Genome
### Title: Length of Genome
### Aliases: length.Rcpp_Genome

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)
length(genome) # 10




