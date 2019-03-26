library(AnaCoDa)


### Name: getTrace
### Title: extracts an object of traces from a parameter object.
### Aliases: getTrace

### ** Examples

 
genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")

genome <- initializeGenomeObject(file = genome_file)
sphi_init <- c(1,1)
numMixtures <- 2
geneAssignment <- sample(1:2, length(genome), replace = TRUE) # random assignment to mixtures
parameter <- initializeParameterObject(genome = genome, sphi = sphi_init, 
                                       num.mixtures = numMixtures, 
                                       gene.assignment = geneAssignment, 
                                       mixture.definition = "allUnique")

trace <- getTrace(parameter) # empty trace object since no MCMC was perfomed




