library(ArchaeoPhases)


### Name: SuccessionPlot
### Title: Density Plots of two successive groups (for groups in temporal
###   order constraint)
### Aliases: SuccessionPlot
### Keywords: gap between two phases transition between two phases phase
###   time range temporal order marginal posterior density succession of
###   phases

### ** Examples

  data(Phases); attach(Phases)
  SuccessionPlot(Phase.1.alpha, Phase.1.beta, Phase.2.alpha, Phase.2.beta, level = 0.95)
  SuccessionPlot(Phase.1.alpha, Phase.1.beta, Phase.2.alpha, Phase.2.beta, 
  exportFile = "Succession", exportFormat = "PNG")



