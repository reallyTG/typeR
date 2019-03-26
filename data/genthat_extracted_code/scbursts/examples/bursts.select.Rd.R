library(scbursts)


### Name: bursts.select
### Title: From a list of bursts, extract those that interest you by
###   passing a selecting function.
### Aliases: bursts.select

### ** Examples


high_popen <- function (seg) {
    segment.popen(seg) > 0.7
}

infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

subset <- bursts.select(bursts, high_popen)

# To export to one .dwt file
subset_f <- bursts.select(bursts, high_popen, one_file=TRUE)




