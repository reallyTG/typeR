library(mosaic)


### Name: xyz2latlon
### Title: Convert back and forth between latitude/longitude and XYZ-space
### Aliases: xyz2latlon latlon2xyz lonlat2xyz

### ** Examples

xyz2latlon(1, 1, 1)     # point may be on sphere of any radius
xyz2latlon(0, 0, 0)     # this produces a NaN for latitude
latlon2xyz(30, 45)
lonlat2xyz(45, 30)



