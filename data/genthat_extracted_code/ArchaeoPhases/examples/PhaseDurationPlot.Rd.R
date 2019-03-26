library(ArchaeoPhases)


### Name: PhaseDurationPlot
### Title: Plot of the duration of a group
### Aliases: PhaseDurationPlot
### Keywords: bayesian statistics highest posterior density credible
###   interval mean marginal posterior density individual phase

### ** Examples

  data(Phases); attach(Phases)

  PhaseDurationPlot(Phase.1.alpha, Phase.1.beta, 0.95, "Duration of Phase 1")
  PhaseDurationPlot(Phase.2.alpha, Phase.2.beta, 0.95, "Duration of Phase 2", colors = FALSE)



