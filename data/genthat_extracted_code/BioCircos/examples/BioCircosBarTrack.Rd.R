library(BioCircos)


### Name: BioCircosBarTrack
### Title: Create a track with a bar plot to be added to a BioCircos
###   tracklist
### Aliases: BioCircosBarTrack

### ** Examples

BioCircos(BioCircosBarTrack('BarTrack', chromosomes = 1:3, starts = 1e+7*2:4, ends = 2.5e+7*2:4, 
  values = 1:3, labels = c('A ', 'B ', 'C '), range = c(0,4)) + BioCircosBackgroundTrack('BGTrack'))




