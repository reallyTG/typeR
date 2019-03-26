library(surveillance)


### Name: epidataCS_plot
### Title: Plotting the Events of an Epidemic over Time and Space
### Aliases: plot.epidataCS epidataCSplot_time epidataCSplot_space
### Keywords: hplot methods spatial

### ** Examples

data("imdepi")

## show the occurrence of events along time
plot(imdepi, "time", main = "Histogram of event time points")
plot(imdepi, "time", by = NULL, main = "Aggregated over both event types")

## show the distribution in space
plot(imdepi, "space", lwd = 2, col = "lavender")

if (surveillance.options("allExamples")) {
  ## with the district-specific population density in the background,
  ## a scale bar, and customized point style
  load(system.file("shapes", "districtsD.RData", package = "surveillance"))
  districtsD$log10popdens <- log10(districtsD$POPULATION/districtsD$AREA)
  keylabels <- (c(1,2,5) * rep(10^(1:3), each=3))[-1]
  plot(imdepi, "space", tiles = districtsD, pop = "log10popdens",
    ## modify point style for better visibility on gray background
    points.args = list(pch=c(1,3), col=c("orangered","blue"), lwd=2),
    ## metric scale bar, see proj4string(imdepi$W)
    sp.layout = layout.scalebar(imdepi$W, scale=100, labels=c("0","100 km")),
    ## gray scale for the population density and white borders
    col.regions = gray.colors(100, start=0.9, end=0.1), col = "white",
    ## color key is equidistant on log10(popdens) scale
    at = seq(1.3, 3.7, by=0.05),
    colorkey = list(labels=list(at=log10(keylabels), labels=keylabels)))
  grid::grid.text("Population density [per km2]", x=0.95, rot=90)
}



