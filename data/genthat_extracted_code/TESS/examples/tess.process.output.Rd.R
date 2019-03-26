library(TESS)


### Name: tess.process.output
### Title: tess.process.output: Summarizing the output of a diversification
###   rate estimation including mass-extinction events. See the
###   tess.analysis function for more information on how such output is
###   generated and the tess.plot.output how the output can be visualized.
###   Also have a look at the vignette for more in detail description and
###   examples.
### Aliases: tess.process.output globalBiDe.output.summary
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
              BURNIN=100)

# Process the output
coniferOutput <- tess.process.output(dir=getwd(),
                                     numExpectedRateChanges=2,
                                     numExpectedMassExtinctions=2)

# Plot the output
tess.plot.output(coniferOutput)



