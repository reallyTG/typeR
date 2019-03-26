library(colorSpec)


### Name: D50
### Title: Standard Illuminant D50 (1964)
### Aliases: D50 D50.5nm
### Keywords: datasets light

### ** Examples

#   the CIE recipe for computing D50.5nm
correction  = 14388 / 14380     # note 5, page 69 in CIE 15:2004
D50.10nm    = daylightSpectra( correction*5000, wavelength=seq(300,830,by=10), roundMs=TRUE )
D50.5nm     = resample( D50.10nm, seq(300,830,by=5), method='linear' )
D50.5nm     = round( D50.5nm, 5 )

summary( D50.5nm )
white.point = product( D50.5nm, xyz1931.1nm, wave='auto' )



