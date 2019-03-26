library(scbursts)


### Name: bursts.get_gaps
### Title: Get the gaps between bursts.
### Aliases: bursts.get_gaps

### ** Examples

infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")
gaps <- bursts.get_gaps(bursts)

head(gaps)



