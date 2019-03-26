library(AnaCoDa)


### Name: getNames
### Title: Gene Names of Genome
### Aliases: getNames

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
 
## reading genome
genome <- initializeGenomeObject(file = genome_file)

## return all gene ids for the genome
geneIDs <- getNames(genome, FALSE)




