library(ArchaeoPhases)


### Name: PhasePlot
### Title: Plot of the characteristics of a group of dates
### Aliases: PhasePlot
### Keywords: bayesian statistics highest posterior density credible
###   interval mean marginal posterior density individual phase

### ** Examples

  data(Phases); attach(Phases)

  #PhasePlot(Phase.1.alpha, Phase.1.beta, level = 0.95, title = "Densities of Phase 1")
  PhasePlot(Phase.2.alpha, Phase.2.beta, level = 0.95, title = "Densities of Phase 2", 
  colors = FALSE, exportFile = "CharacteristicsOfPhase", exportFormat = "SVG")



