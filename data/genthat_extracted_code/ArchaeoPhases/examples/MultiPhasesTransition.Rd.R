library(ArchaeoPhases)


### Name: MultiPhasesTransition
### Title: Transition range for a succession of groups (for groups in
###   temporal order constraint)
### Aliases: MultiPhasesTransition
### Keywords: transition between two phases temporal order succession of
###   phases

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the groups 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasesTransition(Phases, c(4,2), c(5,3))
  
  # In this case, equivalent to 
  MultiPhasesTransition(Phases, c(4,2))




