library(scbursts)


### Name: bursts.defined_by_tcrit
### Title: Divide a recording into bursts defined by a critical time.
### Aliases: bursts.defined_by_tcrit

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")
head(bursts[[1]])




