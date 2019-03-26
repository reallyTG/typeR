library(circlize)


### Name: circos.raster
### Title: Add raster images
### Aliases: circos.raster

### ** Examples

require(png)
image = system.file("extdata", "Rlogo.png", package = "circlize")
image = as.raster(readPNG(image))
circos.initialize(letters[1:8], xlim = c(0, 1))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
    circos.raster(image, CELL_META$xcenter, CELL_META$ycenter, width = "2cm", 
        facing = "inside", niceFacing = TRUE)
})
circos.clear()

## Not run: 
##D # NOTE: following takes quite a long time to run
##D load(system.file("extdata", "doodle.RData", package = "circlize"))
##D circos.par("cell.padding" = c(0, 0, 0, 0))
##D circos.initialize(letters[1:16], xlim = c(0, 1))
##D circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
##D     img = img_list[[CELL_META$sector.numeric.index]]
##D     circos.raster(img, CELL_META$xcenter, CELL_META$ycenter, width = 1, 
##D         height = 1, facing = "bending.inside")
##D }, track.height = 0.25, bg.border = NA)
##D circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
##D     img = img_list[[CELL_META$sector.numeric.index + 16]]
##D     circos.raster(img, CELL_META$xcenter, CELL_META$ycenter, width = 1, 
##D         height = 1, facing = "bending.inside")
##D }, track.height = 0.25, bg.border = NA)
##D circos.clear()
## End(Not run)



