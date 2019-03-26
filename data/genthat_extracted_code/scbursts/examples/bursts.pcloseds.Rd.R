library(scbursts)


### Name: bursts.pcloseds
### Title: Return pcloseds of every burst.
### Aliases: bursts.pcloseds

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")
bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

pcloseds <- bursts.popens(bursts)
hist(pcloseds)




