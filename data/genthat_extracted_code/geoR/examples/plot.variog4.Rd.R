library(geoR)


### Name: plot.variog4
### Title: Plot Directional Variograms
### Aliases: plot.variog4
### Keywords: spatial dplot

### ** Examples

s100.v4 <- variog4(s100, max.dist=1)
# Plotting variograms for the four directions
plot(s100.v4)
# changing plot options
plot(s100.v4, lwd=2)
plot(s100.v4, lty=1, col=c("darkorange", "darkblue", "darkgreen","darkviolet"))
plot(s100.v4, lty=1, lwd=2)
# including the omnidirectional variogram
plot(s100.v4, omni=TRUE)
# variograms on different plots
plot(s100.v4, omni=TRUE, same=FALSE)



