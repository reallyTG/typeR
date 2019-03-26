library(AnaCoDa)


### Name: initializeModelObject
### Title: Model Initialization
### Aliases: initializeModelObject

### ** Examples


#initializing a model object

genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")
expression_file <- system.file("extdata", "expression.csv", package = "AnaCoDa")

genome <- initializeGenomeObject(file = genome_file, 
                                 observed.expression.file = expression_file)
sphi_init <- c(1,1)
numMixtures <- 2
geneAssignment <- sample(1:2, length(genome), replace = TRUE) # random assignment to mixtures
parameter <- initializeParameterObject(genome = genome, sphi = sphi_init, 
                                       num.mixtures = numMixtures, 
                                       gene.assignment = geneAssignment, 
                                       mixture.definition = "allUnique")

# initializing a model object assuming we have observed expression (phi) 
# values stored in the genome object.
initializeModelObject(parameter = parameter, model = "ROC", with.phi = TRUE)

# initializing a model object ignoring observed expression (phi) 
# values stored in the genome object.
initializeModelObject(parameter = parameter, model = "ROC", with.phi = FALSE)




