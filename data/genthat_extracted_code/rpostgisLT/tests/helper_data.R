# library(rpostgisLT)

# test environment
e <- testthat::test_env()

### Get test datasets
data(ibex, package = "adehabitatLT", envir = e)
data(ibexraw, package = "adehabitatLT", envir = e)
data(puechcirc, package = "adehabitatLT", envir = e)
data(albatross, package = "adehabitatLT", envir = e)
data(porpoise, package = "adehabitatLT", envir = e)
data(capreochiz, package = "adehabitatLT", envir = e)

### Update ltraj with 'proj4string' attribute
ibex <- rec(get("ibex", envir = e))
ibexraw <- rec(get("ibexraw", envir = e))
puechcirc <- rec(get("puechcirc", envir = e))
albatross <- rec(get("albatross", envir = e))
porpoise <- rec(get("porpoise", envir = e))
capreochiz <- get("capreochiz", envir = e)

ibex_srs <- ibex
ibexraw_srs <- ibexraw
puechcirc_srs <- puechcirc
albatross_srs <- albatross
porpoise_srs <- porpoise

### Create Type I ltraj
ibexraw_I <- typeII2typeI(ibexraw)
albatross_I <- typeII2typeI(albatross)
porpoise_I <- typeII2typeI(porpoise)

ibexraw_I_srs <- typeII2typeI(ibexraw)
albatross_I_srs <- typeII2typeI(albatross)
porpoise_I_srs <- typeII2typeI(porpoise)

### Set some projection for testing
srs <- CRS("+init=epsg:3395")
srs2 <- CRS("+init=epsg:4326")

attr(ibexraw_srs, 'proj4string') <- srs
attr(puechcirc_srs, 'proj4string') <- srs2
attr(albatross_srs, 'proj4string') <- srs
attr(porpoise_srs, 'proj4string') <- srs2
### Type I
attr(porpoise_I_srs, 'proj4string') <- srs2
attr(albatross_I_srs, 'proj4string') <- srs
attr(ibexraw_I_srs, 'proj4string') <- srs

# refda <- strptime("2003-06-01 00:00", "%Y-%m-%d %H:%M",
#                   tz = "Europe/Paris")
# ibex_4h <- adehabitatLT::sett0(ibex, refda, 4, units = "hour")
# ibex_na <- adehabitatLT::setNA(ibex, refda, 4, units = "hour")
# ibex_int_time <- adehabitatLT::redisltraj(na.omit(ibex_4h), 14400, type = "time")

refda <- strptime("2003-06-01 00:00", "%Y-%m-%d %H:%M",
                  tz = "Europe/Paris")
# set missing relocations
ibex_na <- setNA(ibex, refda, 4, units = "hour")
# time rounding
ibex_4h <- sett0(ibex_na, refda, 4, units = "hour")
# interpolate in space and time
ibex_int_space <- redisltraj(ibex_4h, 400, type = "space")
# Note that 'redisltraj'
# creates an 'infolocs'
# attribute, which is
# a factor (but should be probably be a character)
ibex_int_time <- redisltraj(na.omit(ibex), 14400, type = "time")

# cut ltraj
ibex_cut <- suppressWarnings(adehabitatLT::cutltraj(ibex, "dist > 3000"))
