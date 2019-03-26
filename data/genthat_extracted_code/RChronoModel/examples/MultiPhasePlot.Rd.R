library(RChronoModel)


### Name: MultiPhasePlot
### Title: Plot of the marginal posterior densities of several phases
### Aliases: MultiPhasePlot
### Keywords: phase time range marginal posterior density

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the phases 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasePlot(Phases, c(4,2), c(5,3), title = "Succession of phase 1 and phase 2")
  
  # In this case, equivalent to 
  MultiPhasePlot(Phases, c(4,2), title = "Succession of phase 1 and phase 2")




