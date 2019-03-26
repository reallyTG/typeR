library(oaPlots)


### Name: prepLegend
### Title: Function for arranging plotting layout to accomodate a legend
###   panel
### Aliases: prepLegend

### ** Examples

layout <- c(2,3);
side <- "left"
proportion <- 0.2

prepLegend(layout = layout, side = side, proportion = proportion)
for(i in 1:(layout[1]*layout[2]))
	plot(1:7, 1:7, col = 1:7, pch = 19, cex = 2.2, xaxt = "n",
			yaxt = "n", ann = FALSE)
addLegend(legend = paste("Group", 1:7), font = 2,
		pch = 19, pt.cex = 2, text.col = 1:7, col = 1:7,
		y.intersp = 1.5, cex = 1.5)


layout = rbind(c(1, 2, 3), c(0, 4, 3), c(0, 4, 5))
side = "right"
proportion = 0.15

prepLegend(layout = layout, side = side, proportion = proportion)
for(i in 1:max(layout))
	plot(1:7, 1:7, col = 1:7, pch = 19, cex = 2.2, xaxt = "n",
			yaxt = "n", xlab = "", ylab = "", main = paste("Plot", i))
addLegend(legend = paste("Group", 1:7), font = 2,
		pch = 19, pt.cex = 2, text.col = 1:7, col = 1:7,
		y.intersp = 1.5, cex = 1.5)



