library(BioCircos)


### Name: BioCircosCNVTrack
### Title: Create a track with concentric arcs to be added to a BioCircos
###   tracklist
### Aliases: BioCircosCNVTrack

### ** Examples

BioCircos(BioCircosCNVTrack('BarTrack', chromosomes = 1:3, starts = 1e+7*2:4, ends = 2.5e+7*2:4, 
  values = 1:3, color = "#BB0000", maxRadius = 0.85, minRadius = 0.55) 
  + BioCircosBackgroundTrack('BGTrack'))



