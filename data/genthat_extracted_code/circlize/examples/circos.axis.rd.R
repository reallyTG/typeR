library(circlize)


### Name: circos.axis
### Title: Draw x-axis
### Aliases: circos.axis

### ** Examples

factors = letters[1:8]
circos.par(points.overflow.warning = FALSE)
circos.initialize(factors = factors, xlim = c(0, 10))
circos.trackPlotRegion(factors = factors, ylim = c(0, 10), track.height = 0.1,
    bg.border = NA, panel.fun = function(x, y) {
        circos.text(5, 10, get.cell.meta.data("sector.index"))
})

circos.trackPlotRegion(factors = factors, ylim = c(0, 10))
circos.axis(sector.index = "a")
circos.axis(sector.index = "b", direction = "inside", labels.facing = "outside")
circos.axis(sector.index = "c", h = "bottom")
circos.axis(sector.index = "d", h = "bottom", direction = "inside",
    labels.facing = "reverse.clockwise")
circos.axis(sector.index = "e", h = 5, major.at = c(1, 3, 5, 7, 9))
circos.axis(sector.index = "f", h = 5, major.at = c(1, 3, 5, 7, 9),
    labels = c("a", "c", "e", "g", "f"), minor.ticks = 0)
circos.axis(sector.index = "g", h = 5, major.at = c(1, 3, 5, 7, 9),
    labels = c("a1", "c1", "e1", "g1", "f1"), major.tick = FALSE,
    labels.facing = "reverse.clockwise")
circos.axis(sector.index = "h", h = 2, major.at = c(1, 3, 5, 7, 9),
    labels = c("a1", "c1", "e1", "g1", "f1"), major.tick.percentage = 0.3,
    labels.away.percentage = 0.2, minor.ticks = 2, labels.facing = "clockwise")
circos.clear()

## Not run: 
##D 
##D ############### real-time clock #################
##D factors = letters[1]
##D 
##D circos.par("gap.degree" = 0, "cell.padding" = c(0, 0, 0, 0), "start.degree" = 90)
##D circos.initialize(factors = factors, xlim = c(0, 12))
##D circos.trackPlotRegion(factors = factors, ylim = c(0, 1), bg.border = NA)
##D circos.axis(sector.index = "a", major.at = 0:12, labels = "",
##D     direction = "inside", major.tick.percentage = 0.3)
##D circos.text(1:12, rep(0.5, 12), 1:12, facing = "downward")
##D 
##D while(1) {
##D     current.time = as.POSIXlt(Sys.time())
##D     sec = ceiling(current.time$sec)
##D     min = current.time$min
##D     hour = current.time$hour
##D     
##D     # erase the clock hands
##D     draw.sector(rou1 = 0.8, border = "white", col = "white")
##D 
##D     sec.degree = 90 - sec/60 * 360
##D     arrows(0, 0, cos(sec.degree/180*pi)*0.8, sin(sec.degree/180*pi)*0.8)
##D 
##D     min.degree = 90 - min/60 * 360
##D     arrows(0, 0, cos(min.degree/180*pi)*0.7, sin(min.degree/180*pi)*0.7, lwd = 2)   
##D 
##D     hour.degree = 90 - hour/12 * 360 - min/60 * 360/12
##D     arrows(0, 0, cos(hour.degree/180*pi)*0.4, sin(hour.degree/180*pi)*0.4, lwd = 2)
##D 
##D     
##D     Sys.sleep(1)
##D }
##D circos.clear()
##D 
## End(Not run)




