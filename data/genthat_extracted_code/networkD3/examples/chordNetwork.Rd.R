library(networkD3)


### Name: chordNetwork
### Title: Create Reingold-Tilford Tree network diagrams.
### Aliases: chordNetwork

### ** Examples

## Not run: 
##D #### Data about hair colour preferences, from 
##D ## https://github.com/mbostock/d3/wiki/Chord-Layout
##D 
##D hairColourData <- matrix(c(11975,  1951,  8010, 1013,
##D                             5871, 10048, 16145,  990,
##D                             8916,  2060,  8090,  940,
##D                             2868,  6171,  8045, 6907),
##D                             nrow = 4)
##D                             
##D chordNetwork(Data = hairColourData, 
##D              width = 500, 
##D              height = 500,
##D              colourScale = c("#000000", 
##D                              "#FFDD89", 
##D                              "#957244", 
##D                              "#F26223"),
##D              labels = c("red", "brown", "blond", "gray"))
##D 
## End(Not run)




