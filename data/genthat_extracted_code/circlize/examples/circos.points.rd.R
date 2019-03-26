library(circlize)


### Name: circos.points
### Title: Add points to a plotting region
### Aliases: circos.points

### ** Examples

circos.initialize(letters[1:8], xlim = c(0, 1))
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
    circos.points(runif(10), runif(10))
})
circos.points(runif(10), runif(10), sector.index = "c", pch = 16, col = "red")
circos.clear()




