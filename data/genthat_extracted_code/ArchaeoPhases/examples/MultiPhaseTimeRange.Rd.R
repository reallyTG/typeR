library(ArchaeoPhases)


### Name: MultiPhaseTimeRange
### Title: Phase Time Range for multiple groups
### Aliases: MultiPhaseTimeRange
### Keywords: phase time range

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the groups 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhaseTimeRange(Phases, position_minimum = c(4,2), position_maximum = c(5,3))
  
  # In this case, equivalent to 
  MultiPhaseTimeRange(Phases, position_minimum = c(4,2))



