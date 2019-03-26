library(scbursts)


### Name: bursts.sort
### Title: Order a list of bursts by some function. For instance, popen.
### Aliases: bursts.sort

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")
bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

# A sorted list of bursts. 
sorted <- bursts.sort(bursts, segment.popen)

# You can also write your own functions. If you want P(Open) =~ P(Closed)
variance_fun <- function (seg) {
    # Any function that maps a segment to a number works.
    return(  segment.popen(seg) * segment.pclosed(seg)  )
}

weird_sort <- bursts.sort(bursts, variance_fun)




