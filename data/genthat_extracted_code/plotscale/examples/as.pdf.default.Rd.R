library(plotscale)


### Name: as.pdf.default
### Title: Convert to PDF by Default
### Aliases: as.pdf.default

### ** Examples

options(example.ask = FALSE)
options(device.ask.default = FALSE)
library(lattice)
as.pdf(xyplot(2~3),file = tempfile())



