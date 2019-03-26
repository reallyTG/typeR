library(lattice)


### Name: C_06_update.trellis
### Title: Retrieve and Update Trellis Object
### Aliases: update.trellis [.trellis t.trellis trellis.last.object
### Keywords: dplot

### ** Examples

spots <- by(sunspots, gl(235, 12, labels = 1749:1983), mean)
old.options <- lattice.options(save.object = TRUE)
xyplot(spots ~ 1749:1983, xlab = "", type = "l",
       scales = list(x = list(alternating = 2)),
       main = "Average Yearly Sunspots")
update(trellis.last.object(), aspect = "xy")
trellis.last.object(xlab = "Year")
lattice.options(old.options)



