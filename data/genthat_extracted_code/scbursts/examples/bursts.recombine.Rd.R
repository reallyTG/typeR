library(scbursts)


### Name: bursts.recombine
### Title: Combine bursts into one recording (with obvious spaces between
###   them).
### Aliases: bursts.recombine

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

# This is a single segment!
record <- bursts.recombine(bursts)

# Which means you can do stuff like this
open_dwells <- segment.open_dwells(bursts.recombine(bursts))




