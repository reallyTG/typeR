library(ifultools)


### Name: gridOverlay
### Title: Add a grid over the existing plot
### Aliases: gridOverlay
### Keywords: hplot

### ** Examples

## plot the chaotic beam data and overlay a grid 
old.plt <- splitplot(1,1,1)
plot(rnorm(100))
gridOverlay()
par(old.plt)



