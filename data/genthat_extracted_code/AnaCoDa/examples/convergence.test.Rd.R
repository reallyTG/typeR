library(AnaCoDa)


### Name: convergence.test
### Title: Convergence Test
### Aliases: convergence.test

### ** Examples


## check for convergence after a run:

genome_file <- system.file("extdata", "genome.fasta", package = "AnaCoDa")

genome <- initializeGenomeObject(file = genome_file)
sphi_init <- c(1,1)
numMixtures <- 2
geneAssignment <- sample(1:2, length(genome), replace = TRUE) # random assignment to mixtures
parameter <- initializeParameterObject(genome = genome, sphi = sphi_init, 
                                       num.mixtures = numMixtures, 
                                       gene.assignment = geneAssignment, 
                                       mixture.definition = "allUnique")
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
##D # check if posterior trace has converged
##D convergence.test(object = mcmc, samples = 500, plot = TRUE)
##D 
##D trace <- getTrace(parameter)
##D # check if Mutation trace has converged
##D convergence.test(mcmc, samples = 500, plot = TRUE, what = "Mutation")
##D # check if Sphi trace has converged
##D convergence.test(mcmc, samples = 500, plot = TRUE, what = "Sphi")
##D # check if ExpectedPhi trace has converged
##D convergence.test(mcmc, samples = 500, plot = TRUE, what = "ExpectedPhi")
## End(Not run)



