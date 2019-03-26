library(AnaCoDa)


### Name: getCAI
### Title: Calculate the Codon Adaptation Index
### Aliases: getCAI

### ** Examples


genome_file1 <- system.file("extdata", "more_genes.fasta", package = "AnaCoDa")
genome_file2 <- system.file("extdata", "genome.fasta", package = "AnaCoDa")

## reading genome
referenceGenome <- initializeGenomeObject(file = genome_file1)
testGenome <- initializeGenomeObject(file = genome_file2)

cai <- getCAI(referenceGenome, testGenome)




