library(AnaCoDa)


### Name: initializeGenomeObject
### Title: Genome Initialization
### Aliases: initializeGenomeObject

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
genes_file <- system.file("extdata", "more_genes.fasta", package = "AnaCoDa")
expression_file <- system.file("extdata", "expression.csv", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)

## reading genome and observed expression data
genome <- initializeGenomeObject(file = genome_file, observed.expression.file = expression_file)
 
## add aditional genes to existing genome
genome <- initializeGenomeObject(file = genome_file)
genome <- initializeGenomeObject(file = genes_file, genome = genome, append = TRUE)   




