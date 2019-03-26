library(AnaCoDa)


### Name: findOptimalCodon
### Title: Find and return list of optimal codons
### Aliases: findOptimalCodon

### ** Examples

genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")

genome <- initializeGenomeObject(file = genome_file)
sphi_init <- 1
numMixtures <- 1
geneAssignment <- rep(1, length(genome))
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
##D csp_mat <- getCSPEstimates(parameter, CSP="Selection")
##D opt_codons <- findOptimalCodon(csp_mat)
## End(Not run)



