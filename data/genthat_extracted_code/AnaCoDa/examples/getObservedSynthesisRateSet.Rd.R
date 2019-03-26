library(AnaCoDa)


### Name: getObservedSynthesisRateSet
### Title: Get gene observed synthesis rates
### Aliases: getObservedSynthesisRateSet

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
expression_file <- system.file("extdata", "expression.csv", package = "AnaCoDa") 
## reading genome
genome <- initializeGenomeObject(file = genome_file)


## return expression values as a data.frame with gene ids in the first column.
expressionValues <- getObservedSynthesisRateSet(genome = genome)




