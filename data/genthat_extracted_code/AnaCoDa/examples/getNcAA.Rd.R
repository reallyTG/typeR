library(AnaCoDa)


### Name: getNcAA
### Title: Calculate the Effective Number of Codons for each Amino Acid
### Aliases: getNcAA

### ** Examples


genome_file <- system.file("extdata", "more_genes.fasta", package = "AnaCoDa")
## reading genome
genome <- initializeGenomeObject(file = genome_file)

nc <- getNcAA(genome)




