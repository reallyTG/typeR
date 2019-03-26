library(AnaCoDa)


### Name: getCAIweights
### Title: Calculate the CAI codon weigths for a reference genome
### Aliases: getCAIweights

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")

## reading genome
referenceGenome <- initializeGenomeObject(file = genome_file)

wi <- getCAIweights(referenceGenome)




