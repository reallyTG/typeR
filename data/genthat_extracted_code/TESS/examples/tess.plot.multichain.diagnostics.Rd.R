library(TESS)


### Name: tess.plot.multichain.diagnostics
### Title: tess.plot.multichain.diagnostics: Plotting the mcmc diagnostics
###   of a episodic diversification rate analysis with mass-extinction
###   events.
### Aliases: tess.plot.multichain.diagnostics
### Keywords: models htest

### ** Examples

# Load the data, compute the sampling fraction rho
data(conifers)
totalConiferSpecies <- 630
sampledConiferSpecies <- conifers$Nnode+1
rho <- sampledConiferSpecies / totalConiferSpecies

# Run a tess analysis
tess.analysis(tree = conifers,
              initialSpeciationRate=c(1.0),
              initialExtinctionRate=c(0.5),
              empiricalHyperPriors = FALSE,
              numExpectedRateChanges = 2,
              numExpectedMassExtinctions = 2,
              samplingProbability = rho,
              MAX_ITERATIONS = 200,
              BURNIN = 100,
              dir = "./run_1")

tess.analysis(tree = conifers,
              initialSpeciationRate=c(1.0),
              initialExtinctionRate=c(0.5),
              empiricalHyperPriors = FALSE,
              numExpectedRateChanges = 2,
              numExpectedMassExtinctions = 2,
              samplingProbability = rho,
              MAX_ITERATIONS = 200,
              BURNIN = 100,
              dir = "./run_2")

# Process the output
coniferOutput_1 <- tess.process.output(dir="./run_1",
                                     numExpectedRateChanges=2,
                                     numExpectedMassExtinctions=2)

coniferOutput_2 <- tess.process.output(dir="./run_2",
                                     numExpectedRateChanges=2,
                                     numExpectedMassExtinctions=2)

# Plot the output
outputs <- list(coniferOutput_1,coniferOutput_2)
tess.plot.multichain.diagnostics(outputs)



