library(AnaCoDa)


### Name: getCodonCounts
### Title: Get Codon Counts For all Amino Acids
### Aliases: getCodonCounts

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)
counts <- getCodonCounts(genome)




