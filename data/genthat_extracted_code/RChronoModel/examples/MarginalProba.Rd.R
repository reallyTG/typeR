library(RChronoModel)


### Name: MarginalProba
### Title: Bayesian test for anteriority / posteriority between two
###   parameters
### Aliases: MarginalProba
### Keywords: Bayesian test anteriority / posteriority

### ** Examples

  data(Events); attach(Events)

  # Probability that Event.1 is older than Event.12
  MarginalProba(Event.1, Event.12)
  # Probability that Event.1 is older than Event.2
  MarginalProba(Event.1, Event.2)

  # Probability that the beginning of the phase 1 is older than the end of the phase 1
  # Should always be 1 for every phase
  data(Phases); attach(Phases)

  MarginalProba(Phase.1.alpha, Phase.1.beta)




