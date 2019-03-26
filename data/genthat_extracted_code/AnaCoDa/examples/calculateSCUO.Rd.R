library(AnaCoDa)


### Name: calculateSCUO
### Title: calculates the synonymous codon usage order (SCUO)
### Aliases: calculateSCUO

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)
scuo <- calculateSCUO(genome)




