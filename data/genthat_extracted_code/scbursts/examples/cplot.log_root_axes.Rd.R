library(scbursts)


### Name: cplot.log_root_axes
### Title: Add log-root axes to histogram plot
### Aliases: cplot.log_root_axes

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")
bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

open_dwells <- segment.open_dwells(bursts.recombine(bursts))
hist(log10(open_dwells), axes=FALSE, breaks=30)
cplot.log_root_axes(open_dwells)




