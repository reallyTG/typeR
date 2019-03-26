## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(swephR)
data(SE)

## ---- eval = FALSE-------------------------------------------------------
#  swe_set_ephe_path("C:\\sweph\\ephe")

## ------------------------------------------------------------------------
year <- 2000
month <- 1
day <- 1
hour <- 12
jdut <- swe_julday(year, month, day, hour, SE$GREG_CAL)
jdut

## ------------------------------------------------------------------------
ipl <- SE$SUN
iflag <- SE$FLG_MOSEPH + SE$FLG_SPEED
result <- swe_calc_ut(jdut, ipl, iflag)
result

## ------------------------------------------------------------------------
starname = "sirius"
result <- swe_fixstar2_ut(starname, jdut, iflag)
result

## ------------------------------------------------------------------------
options(digits=15)
result <- swe_heliacal_ut(jdut,c(0,50,10),c(1013.25,15,50,0.25),c(25,1,1,1,5,0.8),starname,
  SE$HELIACAL_RISING,SE$HELFLAG_HIGH_PRECISION+SE$FLG_MOSEPH)
result

## ------------------------------------------------------------------------
  options(digits=6)
  swe_set_ephe_path(NULL)
  data(SE)
  iflag = SE$FLG_SPEED
  {
    #get year
    jyear <- 2000
    #get month
    jmon <- 1
    #get day
    jday <- 1
    #get time
    jhour <- 12
    #determine julian day number (at 12:00 GMT)
    tjd_ut <- swe_julday(jyear, jmon, jday, jhour, SE$GREG_CAL)
    cat("Julian day number (UT) :", tjd_ut, "(",jyear,",",jmon,",",jday,"; proleptic Gregorian calendar)\n")
    cat("planet :",
        c("longitude", "latitude", "distance", "long. speed", "lat. speed"),
        "\n")
    cat("===========================================================\n")
    # loop over all planets
    for (p in SE$SUN:SE$OSCU_APOG) {
      # get the name of the planet p
      objectname = swe_get_planet_name(p)
        # do the coordinate calculation for this planet p
        i = swe_calc_ut(tjd_ut, p, iflag)
        if (i$return < 0) {
          cat("Error :", i$err, "(", objectname, ")\n")
        }
        else
        {
          # print data
          cat (objectname, ":", i$xx[0:5], "\n")
        }
    }
  }

## ------------------------------------------------------------------------
swe_close()

