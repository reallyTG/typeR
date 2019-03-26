library(cheddar)


### Name: PlotNPS
### Title: Plot node properties
### Aliases: PlotNPS PlotBvM PlotMvB PlotMvN PlotNvM
### Keywords: hplot

### ** Examples

data(TL84)
PlotNvM(TL84)

# Set colours and plot symbols directly
PlotNvM(TL84, col=1, pch=19, highlight.nodes=NULL)

# Plot each level of taxonomic resolution in a different colour
PlotNvM(TL84, colour.by='resolved.to', pch=19, highlight.nodes=NULL)

# Plot each level of taxonomic resolution in a specific colour
colour.spec <- c(Species='purple3', Genus='green3', 'red3')
PlotNvM(TL84, colour.by='resolved.to', colour.spec=colour.spec, pch=19, 
        highlight.nodes=NULL)
legend("topright", legend=names(colour.spec), pch=19, col=colour.spec)

# Use PlotNPS to plot trophic height against log10 body mass
PlotNPS(TL84, 'Log10M', 'TrophicHeight', xlab=Log10MLabel(TL84), 
        ylab='Trophic height')


# The 'POM (detritus)' node in the Ythan Estuary dataset lacks both body mass 
# and numerical abundance.
par(mfrow=c(1,2))
data(YthanEstuary)
PlotNvM(YthanEstuary)
PlotNvM(YthanEstuary, show.na=TRUE)



