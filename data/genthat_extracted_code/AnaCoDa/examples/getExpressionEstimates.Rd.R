library(AnaCoDa)


### Name: getExpressionEstimates
### Title: Returns the estimated phi posterior for a gene
### Aliases: getExpressionEstimates

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
model <- initializeModelObject(parameter = parameter, model = "ROC")
samples <- 2500
thinning <- 50
adaptiveWidth <- 25
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, 
                             adaptive.width=adaptiveWidth, est.expression=TRUE,
                             est.csp=TRUE, est.hyper=TRUE, est.mix = TRUE) 
divergence.iteration <- 10
## Not run: 
##D runMCMC(mcmc = mcmc, genome = genome, model = model, 
##D         ncores = 4, divergence.iteration = divergence.iteration)
##D 
##D # get the estimated expression values for all genes based on the mixture 
##D # they are assigned to at each step
##D estimatedExpression <- getExpressionEstimates(parameter, 1:length(genome), 1000)
## End(Not run)




