library(skyscapeR)


### Name: az2dec
### Title: Calculates declination from azimuth and altitude measurements
### Aliases: az2dec

### ** Examples

hor <- download.HWT('HIFVTBGK')

dec <- az2dec(92, hor)
dec <- az2dec(92, hor, alt=4)

# Can also be used for an array of azimuths:
decs <- az2dec( c(87,92,110), hor )



