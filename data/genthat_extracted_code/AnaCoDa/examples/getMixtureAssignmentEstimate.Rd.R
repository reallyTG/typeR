library(AnaCoDa)


### Name: getMixtureAssignmentEstimate
### Title: Returns mixture assignment estimates for each gene
### Aliases: getMixtureAssignmentEstimate

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
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, adaptive.width=adaptiveWidth, 
                             est.expression=TRUE, est.csp=TRUE, est.hyper=TRUE, est.mix = TRUE) 
divergence.iteration <- 10
## Not run: 
##D runMCMC(mcmc = mcmc, genome = genome, model = model, 
##D         ncores = 4, divergence.iteration = divergence.iteration)
##D 
##D # get the mixture assignment for all genes
##D mixAssign <- getMixtureAssignmentEstimate(parameter = parameter, 
##D                                           gene.index = 1:length(genome), samples = 1000)
##D 
##D # get the mixture assignment for a subsample
##D mixAssign <- getMixtureAssignmentEstimate(parameter = parameter, 
##D                                           gene.index = 5:100, samples = 1000)
##D # or
##D mixAssign <- getMixtureAssignmentEstimate(parameter = parameter, 
##D                                           gene.index = c(10, 30:50, 3, 90), samples = 1000)
## End(Not run)




