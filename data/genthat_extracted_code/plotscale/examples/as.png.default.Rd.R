library(plotscale)


### Name: as.png.default
### Title: Convert to PNG by Default
### Aliases: as.png.default

### ** Examples

options(example.ask = FALSE)
options(device.ask.default = FALSE)
library(lattice)
as.png(xyplot(2~3), filename = tempfile())



