library(TESS)


### Name: tess.plot.singlechain.diagnostics
### Title: tess.plot.mcmc.diagnostics: Plotting the single chain mcmc
###   diagnostics of a episodic diversification rate analysis with
###   mass-extinction events.
### Aliases: tess.plot.singlechain.diagnostics
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
              BURNIN = 100)

# Process the output
coniferOutput <- tess.process.output(dir=getwd(),
                                     numExpectedRateChanges=2,
                                     numExpectedMassExtinctions=2)

# Plot the output
tess.plot.singlechain.diagnostics(coniferOutput)



