library(oaPlots)


### Name: densityLegend
### Title: Create a colored density legend for visually representing the
###   distribution of a color variable on a plot
### Aliases: densityLegend

### ** Examples

library(ggplot2)
library(RColorBrewer)

# subset the data object
dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
dsub <- dsub[-which(dsub$z > 4), ]
dsub <- dsub[-which(dsub$z < 3), ]

# define color pallette, color vector and color region breaks
colorPalette <- brewer.pal(9, "Blues")[4:9]
colorObj <- splitColorVar(colorVar = dsub$z, colorPalette)
colorVec <- colorObj$colorVec
breaks <- colorObj$breaks

# plot the data
prepLegend(side = "right", proportion = 0.3)
oaTemplate(xlim = range(dsub$x), ylim = range(dsub$y),
		main = "Diamond Length by Width \n Colored by Depth",
		xlab = "Length (mm)", ylab = "Width (mm)")
points(x = dsub$x, y = dsub$y, col = colorVec, pch = 19, cex = 0.6)

# add the legend
densityLegend(x = dsub$z, colorPalette = colorPalette, side = "right",
		main = "Diamond Depth", colorBreaks = breaks)



