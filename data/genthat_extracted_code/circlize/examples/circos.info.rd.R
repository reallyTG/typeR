library(circlize)


### Name: circos.info
### Title: Get information of the circular plot
### Aliases: circos.info

### ** Examples

factors = letters[1:4]
circos.initialize(factors, xlim = c(0, 1))
circos.trackPlotRegion(ylim = c(0, 1))
circos.trackPlotRegion(ylim = c(0, 1))
circos.info(sector.index = "a", track.index = 1)
circos.info(sector.index = "a", track.index = 1:2)
circos.info(sector.index = c("a", "b"), track.index = 1)
circos.info(sector.index = "a")
circos.info(track.index = 1)
circos.info()
circos.info(plot = TRUE)
circos.clear()




