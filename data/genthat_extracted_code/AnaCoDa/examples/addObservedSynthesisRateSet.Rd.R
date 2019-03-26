library(AnaCoDa)


### Name: addObservedSynthesisRateSet
### Title: Add gene observed synthesis rates
### Aliases: addObservedSynthesisRateSet

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
expression_file <- system.file("extdata", "expression.csv", package = "AnaCoDa") 
## reading genome
genome <- initializeGenomeObject(file = genome_file)


## add expression values after the genome was initiallized, 
## or adding an additional set of expression values
genome <- addObservedSynthesisRateSet(genome = genome, 
                   observed.expression.file = expression_file)




