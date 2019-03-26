## ---- include=FALSE, echo=FALSE------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## ---- printing-spectra, eval=TRUE, include=FALSE-------------------------
# library(tibble)
options(tibble.print_max = 6, tibble.print_min = 4)

## ---- pkg-load, eval=TRUE------------------------------------------------
library(photobiology)
library(lubridate)

## ------------------------------------------------------------------------
my.geocode <- data.frame(lat = 60.16, lon = 24.93, address = "Helsinki")

## ------------------------------------------------------------------------
sun_angles(time = ymd_hms("2017-06-20 08:00:00", tz = "EET"), geocode = my.geocode)

## ------------------------------------------------------------------------
sun_angles()

## ------------------------------------------------------------------------
sun_angles(time = ymd_hms("2014-01-01 0:0:0", tz = "EET") + hours(c(0, 6, 12)), 
           geocode = my.geocode)

## ------------------------------------------------------------------------
my.times <- ymd_hms("2014-01-01 0:0:0", tz = "EET") + hours(c(0, 6, 12))
sun_angles(time = my.times, geocode = my.geocode)

## ------------------------------------------------------------------------
two.geocodes <- data.frame(lat = c(60.16, 65.02), 
                                  lon = c(24.93, 25.47),
                                  address = c("Helsinki", "Oulu"))
sun_angles(time = my.times, geocode = two.geocodes)

## ------------------------------------------------------------------------
sun_angles(time = getWhenMeasured(sun.spct), geocode = getWhereMeasured(sun.spct))

## ------------------------------------------------------------------------
sun_elevation(time = my.times, geocode = my.geocode)

## ------------------------------------------------------------------------
sun_zenith_angle(time = my.times, geocode = my.geocode)

## ------------------------------------------------------------------------
sun_azimuth(time = my.times, geocode = my.geocode)

## ------------------------------------------------------------------------
dates <- ymd("2015-03-01", tz = "EET") + months(0:5)
dates

## ------------------------------------------------------------------------
sunrise_time(now("UTC"), tz = "UTC", geocode = my.geocode)
sunrise_time(now("EET"), tz = "EET", geocode = my.geocode)

## ------------------------------------------------------------------------
sunrise_time(dates, geocode = data.frame(lat = 60, lon = 0))
sunrise_time(dates, geocode = data.frame(lat = -60, lon = 0))

## ------------------------------------------------------------------------
sunrise_time(ymd("2017-03-21", tz = "EET"), 
             tz = "EET", 
             geocode = my.geocode,
             twilight = "civil")
sunrise_time(ymd("2017-03-21", tz = "EET"), 
             tz = "EET", 
             geocode = my.geocode,
             twilight = -10)
sunrise_time(ymd("2017-03-21", tz = "EET"), 
             tz = "EET", 
             geocode = my.geocode,
             twilight = +12)

## ------------------------------------------------------------------------
day_night(dates[1:3], 
          geocode = my.geocode)

## ------------------------------------------------------------------------
day_night(dates[1:2], 
          geocode = my.geocode, 
          unit.out = "days")

## ------------------------------------------------------------------------
day_night(dates[1:2], 
          geocode = my.geocode, 
          unit.out = "datetime")

## ------------------------------------------------------------------------
day_night(dates[1:3], 
          geocode = two.geocodes)

## ------------------------------------------------------------------------
sunrise_time(date = dates, geocode = my.geocode)

## ------------------------------------------------------------------------
sunrise_time(date = dates, tz = "UTC", geocode = my.geocode)

## ------------------------------------------------------------------------
noon_time(date = dates, geocode = my.geocode)

## ------------------------------------------------------------------------
sunset_time(date = dates, geocode = my.geocode)

## ------------------------------------------------------------------------
noon_time(geocode = my.geocode)

## ------------------------------------------------------------------------
sunrise_time(ymd("2017-03-21", tz = "EET"), 
             tz = "EET", 
             geocode = my.geocode)
sunrise_time(ymd("2017-03-21", tz = "EET"), 
             tz = "EET", 
             geocode = my.geocode,
             unit.out = "hours")

## ------------------------------------------------------------------------
day_length(dates, geocode = my.geocode)
night_length(dates, geocode = my.geocode)

## ------------------------------------------------------------------------
day_length(dates, geocode = my.geocode, unit.out = "days")
night_length(dates, geocode = my.geocode, unit.out = "days")

## ------------------------------------------------------------------------
Paris.geo <- data.frame(lon = 2.352222, lat = 48.85661, address = "Paris")
Paris.time <- ymd_hms("2016-09-30 06:00:00", tz = "UTC")
solar_time(Paris.time, geocode = Paris.geo)
solar_time(Paris.time, geocode = Paris.geo, unit.out = "datetime")

## ------------------------------------------------------------------------
my.solar.t <- solar_time(Paris.time, geocode = Paris.geo)
is.solar_time(my.solar.t)
is.numeric(my.solar.t)

## ------------------------------------------------------------------------
my.solar.d <- solar_time(Paris.time, geocode = Paris.geo, unit.out = "datetime")
is.solar_date(my.solar.d)
is.timepoint(my.solar.d)

## ------------------------------------------------------------------------
times <- now(tzone = "UTC") + hours(0:6)
times
as_tod(times)
as_tod(times, unit.out = "minutes")

## ------------------------------------------------------------------------
relative_AM(33)

## ------------------------------------------------------------------------
relative_AM(c(80, 60, 40, 20))

