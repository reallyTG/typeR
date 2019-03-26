library(AnaCoDa)


### Name: initializeParameterObject
### Title: Initialize Parameter
### Aliases: initializeParameterObject

### ** Examples


genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
restart_file <- system.file("extdata", "restart_file.rst", package = "AnaCoDa")

genome <- initializeGenomeObject(file = genome_file)

## initialize a new parameter object
sphi_init <- 1
numMixtures <- 1
geneAssignment <- rep(1, length(genome))
parameter <- initializeParameterObject(genome = genome, sphi = sphi_init, 
                                       num.mixtures = numMixtures, 
                                       gene.assignment = geneAssignment, 
                                       mixture.definition = "allUnique")

## re-initialize a parameter object from a restart file. Useful for checkpointing
parameter <- initializeParameterObject(init.with.restart.file = restart_file)

## initialize a parameter object with a custon mixture definition matrix
def.matrix <- matrix(c(1,1,1,2), ncol=2)
geneAssignment <- sample(1:2, length(genome), replace = TRUE) # random assignment to mixtures
parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2), num.mixtures = 2,
                                       gene.assignment = geneAssignment,
                                       mixture.definition.matrix = def.matrix)




