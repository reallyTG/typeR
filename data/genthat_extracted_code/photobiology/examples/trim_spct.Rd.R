library(photobiology)


### Name: trim_spct
### Title: Trim (or expand) head and/or tail of a spectrum
### Aliases: trim_spct trim_mspct trim2overlap extend2extremes

### ** Examples

trim_spct(sun.spct, low.limit=300)
trim_spct(sun.spct, low.limit=300, fill=NULL)
trim_spct(sun.spct, low.limit=300, fill=NA)
trim_spct(sun.spct, low.limit=300, fill=0.0)
trim_spct(sun.spct, range = c(300, 400))
trim_spct(sun.spct, range = c(300, NA))
trim_spct(sun.spct, range = c(NA, 400))



