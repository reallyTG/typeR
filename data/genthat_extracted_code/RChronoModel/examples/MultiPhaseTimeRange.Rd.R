library(RChronoModel)


### Name: MultiPhaseTimeRange
### Title: Phase Time Range for multiple phases
### Aliases: MultiPhaseTimeRange
### Keywords: phase time range

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the phases 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhaseTimeRange(Phases, c(4,2), c(5,3))
  
  # In this case, equivalent to 
  MultiPhaseTimeRange(Phases, c(4,2))



