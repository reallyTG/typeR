library(BAMMtools)


### Name: plot.bammdata
### Title: Plot 'BAMM'-estimated macroevolutionary rates on a phylogeny
### Aliases: plot.bammdata
### Keywords: graphics models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

# The first call to plot.bammdata
# No calculations or assignments of rates have been made
plot(ed, lwd = 3, spex = "s") # calls dtRates & assignColorBreaks

# Compare the different color breaks methods
par(mfrow=c(1,3))
plot(ed, lwd = 3, spex = "s", breaksmethod = "linear")
title(main="linear")
plot(ed, lwd = 3, spex = "s", breaksmethod = "quantile")
title(main="quantile")
plot(ed, lwd = 3, spex = "s", breaksmethod = "jenks")
title(main="jenks")

## Not run: 
##D # now plot.bammdata no longer calls dtRates
##D ed <- dtRates(ed, tau = 0.01)
##D xx <- plot(ed, lwd = 3, spex = "s")
##D 
##D # you can plot subtrees while preserving the original 
##D # rates to colors map by passing the colorbreaks object as an argument
##D sed <- subtreeBAMM(ed, node = 103)
##D plot(sed, lwd = 3, colorbreaks = xx$colorbreaks)
##D sed <- subtreeBAMM(ed, node = 140)
##D plot(sed, lwd = 3, colorbreaks = xx$colorbreaks)
##D # note how if we do not pass colorbreaks the map is 
##D # no longer relative to the rest of the tree and the plot is quite
##D # distinct from the original
##D plot(sed, lwd = 3)
##D 
##D # if you want to change the value of tau and the rates to colors map for
##D # the entire tree
##D ed <- dtRates(ed, tau = 0.002)
##D xx <- plot(ed, lwd = 3, spex = "s")
##D # now you can re-plot the subtrees using this finer tau partition
##D sed <- subtreeBAMM(ed, node = 103)
##D sed <- dtRates(sed, 0.002)
##D plot(sed, lwd = 3, colorbreaks = xx$colorbreaks)
##D sed <- subtreeBAMM(ed, node = 140)
##D sed <- dtRates(sed, 0.002)
##D plot(sed, lwd = 3, colorbreaks = xx$colorbreaks)
##D 
##D # multi-panel plotting and adding shifts of specific posterior samples
##D par(mfrow=c(2,3))
##D samples <- sample(1:length(ed$eventData), 6)
##D ed <- dtRates(ed, 0.005)
##D # individual plots will have a color map relative to the mean
##D xx <- plot(ed, show=FALSE)
##D for (i in 1:6) {
##D     ed <- dtRates(ed, 0.005, samples[i])
##D     plot(ed, colorbreaks=xx$colorbreaks)
##D     addBAMMshifts(ed,index=samples[i],method="phylogram", par.reset=FALSE)	
##D }
##D dev.off()
##D 
##D # color options
##D ed <- dtRates(ed,0.01)
##D plot(ed, pal="temperature",lwd=3)
##D plot(ed, pal="terrain",lwd=3)
##D plot(ed, pal=c("darkgreen","yellow2","red"),lwd=3)
##D plot(ed,method="polar",pal="Spectral", lwd=3)
##D plot(ed,method="polar",pal="RdYlBu", lwd=3)
## End(Not run)



