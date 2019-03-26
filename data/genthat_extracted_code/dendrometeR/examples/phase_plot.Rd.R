library(dendrometeR)


### Name: phase_plot
### Title: Plot stem-cyclic phases
### Aliases: phase_plot

### ** Examples

data(dmCD)
dm.phase <- phase_def(dmCD)
phase_plot(dmCD, dm.phase)

# zoom in on the dendrometer series
phase_plot(dmCD, dm.phase, period = c(133, 142))

# customization options
phase_plot(dmCD, dm.phase, period = c("2008-05-12", "2008-05-22"),
           colPhases = c("green", "cyan", "orange"),
           pch = 4, main = "Dendrometer", ylab = "Values")

## Not run: 
##D 
##D # specific sensors may be selected as follows:
##D data(dmED)
##D dm.gpf <- fill_gaps(dmED)
##D dm.phase <- phase_def(dm.gpf)
##D phase_plot(dm.gpf, dm.phase, sensor = 1)
##D phase_plot(dm.gpf, dm.phase, sensor = c(2,1))
##D phase_plot(dm.gpf, dm.phase, sensor = "Beech03")
##D phase_plot(dm.gpf, dm.phase, sensor = c("Beech03", "Beech04"))
## End(Not run)




