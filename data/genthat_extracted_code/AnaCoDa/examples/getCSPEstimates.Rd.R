library(AnaCoDa)


### Name: getCSPEstimates
### Title: Return Codon Specific Paramters (or write to csv) estimates as
###   data.frame
### Aliases: getCSPEstimates

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
##D ## return estimates for codon specific parameters
##D csp_mat <- getCSPEstimates(parameter)
##D 
##D # write the result directly to the filesystem as a csv file. No values are returned
##D getCSPEstimates(parameter, filename=file.path(tempdir(), "test.csv"))
##D 
## End(Not run)



