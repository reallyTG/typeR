library(oaPlots)


### Name: scatterplotDL
### Title: Plot a base-graphics scatterplot with accompanying density
###   legend
### Aliases: scatterplotDL

### ** Examples

library(ggplot2)
library(RColorBrewer)
colorPalette <- brewer.pal(9, "YlOrRd")[4:9]
scatterplotDL(x = mtcars$mpg, y = mtcars$wt, colorVar = mtcars$hp,
legendTitle = "Horse Power", colorPalette = colorPalette, pch = 19,
		xlab = "MPG (miles per gallon)", ylab = "Weight (tonnes)",
		main = "MPG by Weight in Cars \n Colored by Horse Power")



