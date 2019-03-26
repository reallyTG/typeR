library(AnaCoDa)


### Name: getNc
### Title: Calculate the Effective Number of Codons
### Aliases: getNc

### ** Examples


genome_file <- system.file("extdata", "more_genes.fasta", package = "AnaCoDa")
## reading genome
genome <- initializeGenomeObject(file = genome_file)

nc <- getNc(genome)




