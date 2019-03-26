library(scbursts)


### Name: bursts.popens
### Title: Return popens of every burst.
### Aliases: bursts.popens

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

popens <- bursts.popens(bursts)
hist(popens)




