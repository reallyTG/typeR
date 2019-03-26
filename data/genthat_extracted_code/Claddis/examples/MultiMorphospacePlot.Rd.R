library(Claddis)


### Name: MultiMorphospacePlot
### Title: Plot Multiple Morphopaces
### Aliases: MultiMorphospacePlot
### Keywords: coordinates principal

### ** Examples


# Create PCOA data:
pcoa_input <- MorphMatrix2PCoA(Michaux1989)

# Plot first three axes:
MultiMorphospacePlot(pcoa_input, N_axes = 3)




