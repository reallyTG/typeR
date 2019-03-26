library(cheddar)


### Name: PlotWagonWheel
### Title: Plot wagon wheel
### Aliases: PlotWagonWheel
### Keywords: hplot

### ** Examples

data(TL84)
# Ploesoma sp. is the focal species
PlotWagonWheel(TL84, 'Ploesoma sp.')

# Show nodes as numbers
PlotWagonWheel(TL84, 'Ploesoma sp.', show.nodes.as='labels')

# 'Daphnia pulex' is the focus, nodes ordered by degree (total number of
# trophic links), lines partially transparent
PlotWagonWheel(OrderCommunity(TL84, 'Degree'), 'Daphnia pulex',
               show.nodes.as='labels', link.col=rgb(0.8,0.8,0.8,0.5))





