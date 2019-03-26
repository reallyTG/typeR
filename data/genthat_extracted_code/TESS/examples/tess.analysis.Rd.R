library(TESS)


### Name: tess.analysis
### Title: tess.analysis: Diversification rate estimation under an episodic
###   birth-death process including mass-extinction events.
### Aliases: tess.analysis globalBiDe.analysis
### Keywords: models htest

### ** Examples

# we load the conifers as the test data set
data(conifers)

# for the conifers we know what the total number of species is
total <- 630
# thus, we can compute what the sampling fraction is
rho <- (conifers$Nnode+1)/total


# next, we specify the prior mean and standard deviation 
# for the speciation and extinction rate
mu_lambda = 0.15
std_lambda = 0.02
mu_mu = 0.09
std_mu = 0.02

# now we can run the entire analysis.
# note that a full analyses should be run much longer
tess.analysis( tree=conifers,
               initialSpeciationRate=exp(mu_lambda),
               initialExtinctionRate=exp(mu_mu),
               empiricalHyperPriors = FALSE,
               speciationRatePriorMean = mu_lambda,
               speciationRatePriorStDev = std_lambda,
               extinctionRatePriorMean = mu_mu,
               extinctionRatePriorStDev = std_mu,
               numExpectedRateChanges = 2,
               samplingProbability = rho,
               numExpectedMassExtinctions = 2,
               BURNIN = 100,
               MAX_ITERATIONS = 200,
               THINNING = 10,
               dir = "analysis_conifer")
               
# You may want to look into the vignette for a more detailed description
# of the features for an analysis.
# also have a look at the functions tess.process.output and tess.plot.output




