library(scbursts)


### Name: risetime.correct_gaussian
### Title: Undo the effect of the gaussian filter.
### Aliases: risetime.correct_gaussian

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)

dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")




