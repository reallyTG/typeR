library(circlize)


### Name: circos.updatePlotRegion
### Title: Update the plotting region in an existed cell
### Aliases: circos.updatePlotRegion

### ** Examples

circos.initialize(letters[1:8], xlim = c(0, 1))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
    circos.text(CELL_META$xcenter, CELL_META$ycenter, CELL_META$sector.index)
})
circos.update(sector.index = "b", track.index = 1)
circos.rect(CELL_META$cell.xlim[1], CELL_META$cell.ylim[1],
            CELL_META$cell.xlim[2], CELL_META$cell.ylim[2],
            col = "#FF000080")
circos.clear()




