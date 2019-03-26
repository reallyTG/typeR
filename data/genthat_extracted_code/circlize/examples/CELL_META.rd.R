library(circlize)


### Name: CELL_META
### Title: Easy to way to get meta data in the current cell
### Aliases: CELL_META

### ** Examples

pdf(NULL)
circos.initialize("a", xlim = c(0, 1))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
	print(CELL_META$sector.index)
	print(CELL_META$xlim)
})
dev.off()



