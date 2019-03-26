library(RChronoModel)


### Name: MultiPhasesGap
### Title: Gap/Hiatus between a succession of phases (for phases in
###   temporal order constraint)
### Aliases: MultiPhasesGap
### Keywords: bayesian statistics gap between two phases temporal order
###   succession of phases

### ** Examples

  # Data extracted from ChronoModel software
  data(Phases)
  
  # List of the name of the phases 
  names(Phases)
  
  # Stipulating position_maximum
  MultiPhasesGap(Phases, c(4,2), c(5,3))
  
  # In this case, equivalent to 
  MultiPhasesGap(Phases, c(4,2))



