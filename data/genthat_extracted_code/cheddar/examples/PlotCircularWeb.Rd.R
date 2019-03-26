library(cheddar)


### Name: PlotCircularWeb
### Title: Plot circular web
### Aliases: PlotCircularWeb
### Keywords: hplot

### ** Examples

data(TL84)
PlotCircularWeb(TL84)

# Plot the first node at the 6 o'clock position
PlotCircularWeb(TL84, origin.degrees=180)

# Plot the first node at the 6 o'clock position and plot nodes 
# counter-clockwise
PlotCircularWeb(TL84, origin.degrees=180, clockwise=FALSE)



