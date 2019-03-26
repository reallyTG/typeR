library(cheddar)


### Name: PlotTLPS
### Title: Plot trophic-link properties
### Aliases: PlotTLPS PlotPredationMatrix PlotBCvBR PlotBRvBC PlotMCvMR
###   PlotMRvMC PlotNCvNR PlotNRvNC
### Keywords: hplot

### ** Examples

data(TL84)

# The predation matrix
PlotPredationMatrix(TL84)

# The predation matrix with rows ordered by body mass
PlotPredationMatrix(TL84, resource.order='M')

# Colours and symbols by resource.category
PlotMCvMR(TL84)

# Colours and symbols by consumer.category
PlotMCvMR(TL84, bg.by='consumer.category', symbol.by='consumer.category', 
          colour.by='consumer.category')

# Consumer trophic height against resource log10(M)
PlotTLPS(TL84, 'resource.Log10M', 'consumer.TrophicHeight')

# Log10(M of resource / M of consumer) against consumer log10(M)
PlotTLPS(TL84, 'consumer.Log10M', 'Log10RCMRatio')



