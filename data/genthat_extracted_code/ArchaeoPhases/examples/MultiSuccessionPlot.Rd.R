library(ArchaeoPhases)


### Name: MultiSuccessionPlot
### Title: Successive Phases Density Plots (for groups in temporal order
###   constraint)
### Aliases: MultiSuccessionPlot
### Keywords: marginal posterior density gap between two phases transition
###   between two phases phase time range temporal order succession of
###   phases

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the groups 
  names(Phases)
  
  # Stipulating position_end
  MultiSuccessionPlot(Phases, c(4,2), c(5,3), title = "Succession of phase 1 and phase 2")
  
  # In this case, equivalent to 
  MultiSuccessionPlot(Phases, c(4,2), title = "Succession of phase 1 and phase 2", colors = c(3,4))
  
  # export
  MultiSuccessionPlot(Phases, c(4,2), exportFile = "MultiSuccessionPlot", exportFormat = "SVG")



