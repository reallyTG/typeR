library(scbursts)


### Name: cplot.pclosed_ts
### Title: Plot Time Series (ts) of P(Closed).
### Aliases: cplot.pclosed_ts

### ** Examples


infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")
bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

cplot.pclosed_ts(bursts, "P(Closed) Time Series, 2018-09-20")




