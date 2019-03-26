library(ArchaeoPhases)


### Name: MultiPhasesGap
### Title: Gap/Hiatus between a succession of groups (for groups in
###   temporal order constraint)
### Aliases: MultiPhasesGap
### Keywords: bayesian statistics gap between two phases temporal order
###   succession of phases

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the groups 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasesGap(Phases, position_minimum = c(4,2), position_maximum = c(5,3))
  
  # In this case, equivalent to 
  MultiPhasesGap(Phases, position_minimum = c(4,2))



