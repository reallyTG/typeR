library(circlize)


### Name: circlize
### Title: Convert to polar coordinate system
### Aliases: circlize

### ** Examples

pdf(NULL)
factors = c("a", "b")
circos.initialize(factors, xlim = c(0, 1))
circos.track(ylim = c(0, 1))
# x = 0.5, y = 0.5 in sector a and track 1
circlize(0.5, 0.5, sector.index = "a", track.index = 1)
circos.clear()
dev.off()




