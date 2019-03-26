library(MeTo)


### Name: ETref
### Title: FAO-56 Penman-Monteith grass reference evapotranspiration
### Aliases: ETref

### ** Examples

# --------------------------------------------
#  Daily Evapotranspiration
# --------------------------------------------

ETref(x = 187, Rs = 22.07, elev = 100, lat.deg = 50.8, Tmax = 21.5, Tmin = 12.3,
      Rhmax = 84, Rhmin = 63,
      u = 2.78, control = list(uz = 10), P = 100.1)

# Calculation with sunshine hour (n) instead of
# global radiation (Rs) (Rs ist estimated from n with estRs):

ETref(x = 187, n = 9.25, elev = 100, lat.deg = 50.8, Tmax = 21.5, Tmin = 12.3,
     Rhmax = 84, Rhmin = 63,
     u = 2.78, control = list(uz = 10), P = 100.1)

# --------------------------------------------
#  Hourly Evapotranspiration
# --------------------------------------------

ETref(x = as.POSIXct(c('2018-10-01 14:30', '2018-10-01 15:30')),
      Tmean = c(38, 37.8), Rhmean = c(52, 52.3), u = c(3.3, 3.2), Rs = c(2.450, 2.5), elev = 8,
      lat.deg = 16.22, long.deg = 343.75, G = c(0.175, 0.178) , P = c(101.21, 101.21) ,
      control = list(Lz = 15))

# If only one time step is calculated tl must be provided (1 for hourly, 0.5 for 30 minute periods):

ETref(x = as.POSIXct('2018-10-01 14:30'), tl = 1,
      Tmean = 38, Rhmean = 52, u = 3.3, Rs = 2.450, elev = 8,
      lat.deg = 16.22, long.deg = 343.75, G = 0.1749218, P = 101.2056,
      control = list(Lz = 15))

# Calculation with missing soil heat flux (G) and atmospheric pressure (P) (G is estimated with estG
# and P with estP)

ETref(x = as.POSIXct('2018-10-01 14:30'), tl = 1,
      Tmean = 38, Rhmean = 52, u = 3.3, Rs = 2.450, elev = 8,
      lat.deg = 16.22, long.deg = 343.75,
      control = list(Lz = 15))
# --------------------------------------------



