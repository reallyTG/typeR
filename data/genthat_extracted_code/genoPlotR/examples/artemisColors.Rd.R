library(genoPlotR)


### Name: artemisColors
### Title: Artemis Colors
### Aliases: artemisColors
### Keywords: data

### ** Examples

artCol <- artemisColors()
plot(rep(1, nrow(artCol)), artCol$n, xlim=c(1, 2), type="n")
text(rep(1, nrow(artCol)), artCol$n, labels=artCol$n, col=artCol$colors)
text(rep(1, nrow(artCol)), artCol$n, labels=artCol$names, col=artCol$colors,
     pos=4, offset=1)




