library(BioCircos)


### Name: BioCircosSNPTrack
### Title: Create a track with SNPs to be added to a BioCircos tracklist
### Aliases: BioCircosSNPTrack

### ** Examples

BioCircos(BioCircosSNPTrack('SNPTrack', chromosomes = 1:3, positions = 1e+7*2:4, 
  values = 1:3, colors = "Accent", labels = c('A', 'B', 'C')) + BioCircosBackgroundTrack('BGTrack'))




