library(RChronoModel)


### Name: MultiPhasesTransition
### Title: Transition range for a succession of phases (for phases in
###   temporal order constraint)
### Aliases: MultiPhasesTransition
### Keywords: transition between two phases temporal order succession of
###   phases

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the phases 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasesTransition(Phases, c(4,2), c(5,3))
  
  # In this case, equivalent to 
  MultiPhasesTransition(Phases, c(4,2))




