library(photobiology)


### Name: sun_angles
### Title: Solar angles
### Aliases: sun_angles sun_angles_fast sun_elevation sun_zenith_angle
###   sun_azimuth

### ** Examples

library(lubridate)
sun_angles()
sun_azimuth()
sun_elevation()
sun_zenith_angle()
sun_angles(ymd_hms("2014-09-23 12:00:00"))
sun_angles(ymd_hms("2014-09-23 12:00:00"),
           geocode = data.frame(lat=60, lon=0))
sun_angles(ymd_hms("2014-09-23 12:00:00") + minutes((0:6) * 10))




