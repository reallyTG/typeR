library(circlize)


### Name: get.cell.meta.data
### Title: Get the meta data of a cell
### Aliases: get.cell.meta.data

### ** Examples

factors = letters[1:4]
circos.initialize(factors, xlim = c(0, 1))
circos.trackPlotRegion(ylim = c(0, 1), panel.fun = function(x, y) {
    print(get.cell.meta.data("xlim"))
})
print(get.cell.meta.data("xlim", sector.index = "a", track.index = 1))
circos.clear()



