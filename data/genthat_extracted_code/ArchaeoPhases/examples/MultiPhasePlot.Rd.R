library(ArchaeoPhases)


### Name: MultiPhasePlot
### Title: Plot of the marginal posterior densities of several groups
### Aliases: MultiPhasePlot
### Keywords: phase time range marginal posterior density

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the groups 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasePlot(Phases, c(4,2), c(5,3), title = "Succession of phase 1 and phase 2")
  
  # In this case, equivalent to 
  MultiPhasePlot(Phases, c(4,2), title = "Succession of phase 1 and phase 2", colors = c(3,4))
  
  # Export 
  MultiPhasePlot(Phases, c(4,2), exportFile = "MultiPhasePlot", exportFormat = "PNG")



