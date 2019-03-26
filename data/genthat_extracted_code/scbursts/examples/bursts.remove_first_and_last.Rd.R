library(scbursts)


### Name: bursts.remove_first_and_last
### Title: Remove the first and last burst from the list.
### Aliases: bursts.remove_first_and_last

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

# If there seem to be bad bursts at the ends
bursts <- bursts.remove_first_and_last(bursts)




