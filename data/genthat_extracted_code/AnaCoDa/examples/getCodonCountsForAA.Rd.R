library(AnaCoDa)


### Name: getCodonCountsForAA
### Title: Get Codon Counts For a specific Amino Acid
### Aliases: getCodonCountsForAA

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)
counts <- getCodonCountsForAA("A", genome)




