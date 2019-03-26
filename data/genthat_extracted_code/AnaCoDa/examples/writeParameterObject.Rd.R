library(AnaCoDa)


### Name: writeParameterObject
### Title: Write Parameter Object to a File
### Aliases: writeParameterObject

### ** Examples

## Not run: 
##D 
##D genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
##D 
##D genome <- initializeGenomeObject(file = genome_file)
##D sphi_init <- c(1,1)
##D numMixtures <- 2
##D geneAssignment <- sample(1:2, length(genome), replace = TRUE) # random assignment to mixtures
##D parameter <- initializeParameterObject(genome = genome, sphi = sphi_init, 
##D                                        num.mixtures = numMixtures, 
##D                                        gene.assignment = geneAssignment, 
##D                                        mixture.definition = "allUnique")
##D 
##D ## writing an empty parameter object as the runMCMC routine was not called yet
##D writeParameterObject(parameter = parameter, file = file.path(tempdir(), "file.Rda"))
##D 
## End(Not run)




