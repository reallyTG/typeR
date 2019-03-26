library(tsna)


### Name: tiedDuration
### Title: Compute the duration of time (or count of events) that each
###   vertex is tied/connected to others by an edge
### Aliases: tiedDuration

### ** Examples

  data(moodyContactSim)
  tiedDuration(moodyContactSim)
  
  data(McFarland_cls33_10_16_96)
  # compute ratio of incoming vs. outgoing speach acts
  outDur <- tiedDuration(cls33_10_16_96, mode='counts',neighborhood = 'out') 
  inDur <- tiedDuration(cls33_10_16_96, mode='counts',neighborhood = 'in')
  outDur / inDur



