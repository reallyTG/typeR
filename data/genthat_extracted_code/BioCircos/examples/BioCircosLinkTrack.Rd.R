library(BioCircos)


### Name: BioCircosLinkTrack
### Title: Create an inner track with links to be added to a BioCircos
###   tracklist
### Aliases: BioCircosLinkTrack

### ** Examples

start_chromosomes <- 1:5
end_chromosomes <- 2*10:6
start_pos <- 2.5e+7*2:6
end_pos <- 2e+7*1:5
BioCircos(BioCircosLinkTrack('LinkTrack', start_chromosomes, start_pos, start_pos+1,
  end_chromosomes, end_pos, end_pos+1, color = '#FF00FF'))




