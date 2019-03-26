library(photobiology)


### Name: Extract
### Title: Extract or replace parts of a spectrum
### Aliases: Extract [.generic_spct [.raw_spct [.cps_spct [.source_spct
###   [.response_spct [.filter_spct [.reflector_spct [.object_spct
###   [.chroma_spct [<-.generic_spct $<-.generic_spct

### ** Examples

sun.spct[sun.spct$w.length > 400, ]
subset(sun.spct, w.length > 400)

tmp.spct <- sun.spct
tmp.spct[tmp.spct$s.e.irrad < 1e-5 , "s.e.irrad"] <- 0
e2q(tmp.spct[ , c("w.length", "s.e.irrad")]) # restore data consistency!




