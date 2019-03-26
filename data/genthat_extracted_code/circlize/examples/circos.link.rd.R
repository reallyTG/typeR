library(circlize)


### Name: circos.link
### Title: Draw links between points or/and intervals
### Aliases: circos.link

### ** Examples

factors = letters[1:8]
circos.par(points.overflow.warning = FALSE)
circos.initialize(factors = factors, xlim = c(0, 10))
circos.track(factors = factors, ylim = c(0, 1), bg.col = "grey", 
    bg.border = NA, track.height = 0.05)
circos.link("a", 5, "c", 5, border = 1)
circos.link("b", 5, "d", c(4, 6), border = 1)
circos.link("a", c(2, 3), "f", c(4, 6), border = 1)
circos.link("e", c(2, 3), "g", 5, border = 1)
circos.clear()

circos.par(points.overflow.warning = FALSE)
circos.initialize(factors = factors, xlim = c(0, 10))
circos.track(factors = factors, ylim = c(0, 1), bg.col = "grey", 
    bg.border = NA, track.height = 0.05)
circos.link("a", 5, "b", 5, directional = 1, arr.length = 0.2)
circos.link("c", c(3, 7), "d", c(3, 7), directional = 1, 
    arr.col = "white", arr.length = 0.2)
circos.link("e", c(4, 6), "f", c(4, 6), directional = 1, 
    arr.type = "big.arrow", arr.length = 0.04)
circos.clear()




