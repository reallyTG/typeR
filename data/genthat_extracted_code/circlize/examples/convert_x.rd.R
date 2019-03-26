library(circlize)


### Name: convert_x
### Title: Convert unit on x direction in data coordinate
### Aliases: convert_x

### ** Examples

fa = letters[1:10]
circos.par(cell.padding = c(0, 0, 0, 0), track.margin = c(0, 0))
circos.initialize(fa, xlim = cbind(rep(0, 10), runif(10, 0.5, 1.5)))
circos.track(ylim = c(0, 1), track.height = convert_height(5, "mm"),
    panel.fun = function(x, y) {
        circos.lines(c(0, 0 + convert_x(5, "mm")), c(0.5, 0.5), col = "blue")
    })
circos.par(track.margin = c(0, convert_height(2, "mm")))
circos.track(ylim = c(0, 1), track.height = convert_height(1, "cm"),
    panel.fun = function(x, y) {
        xcenter = get.cell.meta.data("xcenter")
        circos.lines(c(xcenter, xcenter), c(0, convert_y(1, "cm")), col = "red")
    })
circos.par(track.margin = c(0, convert_height(5, "mm")))
circos.track(ylim = c(0, 1), track.height = convert_height(1, "inches"),
    panel.fun = function(x, y) {
        line_length_on_x = convert_x(1*sqrt(2)/2, "cm")
        line_length_on_y = convert_y(1*sqrt(2)/2, "cm")
        circos.lines(c(0, line_length_on_x), c(0, line_length_on_y), col = "orange")
    })
circos.clear()



