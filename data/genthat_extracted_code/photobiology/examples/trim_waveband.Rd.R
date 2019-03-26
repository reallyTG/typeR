library(photobiology)


### Name: trim_waveband
### Title: Trim (or expand) head and/or tail
### Aliases: trim_waveband

### ** Examples

VIS <- waveband(c(380, 760)) # nanometres

trim_waveband(VIS, c(400,700))
trim_waveband(VIS, low.limit = 400)
trim_waveband(VIS, high.limit = 700)




