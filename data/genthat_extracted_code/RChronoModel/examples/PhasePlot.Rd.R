library(RChronoModel)


### Name: PhasePlot
### Title: Plot of the marginal posterior densities of a phase
### Aliases: PhasePlot
### Keywords: bayesian statistics highest posterior density credible
###   interval mean marginal posterior density individual phase

### ** Examples

  data(Phases); attach(Phases)

  PhasePlot(Phase.1.alpha, Phase.1.beta, 0.95, "Densities of Phase 1")
  PhasePlot(Phase.2.alpha, Phase.2.beta, 0.95, "Densities of Phase 2",colors = FALSE)



