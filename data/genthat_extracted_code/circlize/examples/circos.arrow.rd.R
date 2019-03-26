library(circlize)


### Name: circos.arrow
### Title: Draw arrow which is paralle to the circle
### Aliases: circos.arrow

### ** Examples

circos.initialize(letters[1:4], xlim = c(0, 1))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
	circos.arrow(0, 1, y = 0.5, width = 0.4, arrow.head.length = ux(1, "cm"), 
		col = "red", tail = ifelse(CELL_META$sector.index %in% c("a", "c"), 
			"point", "normal"))
}, bg.border = NA, track.height = 0.4)

########## cell cycle ###########
cell_cycle = data.frame(phase = factor(c("G1", "S", "G2", "M"), 
                                    levels = c("G1", "S", "G2", "M")),
	                      hour = c(11, 8, 4, 1))
color = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")
circos.par(start.degree = 90)
circos.initialize(cell_cycle$phase, xlim = cbind(rep(0, 4), cell_cycle$hour))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
	circos.arrow(CELL_META$xlim[1], CELL_META$xlim[2], 
		arrow.head.width = CELL_META$yrange*0.8, arrow.head.length = ux(1, "cm"),
		col = color[CELL_META$sector.numeric.index])
	circos.text(CELL_META$xcenter, CELL_META$ycenter, CELL_META$sector.index, 
		facing = "downward")
}, bg.border = NA, track.height = 0.3)
circos.clear()



