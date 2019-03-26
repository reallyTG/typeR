library(MeTo)


### Name: Rn
### Title: Net radiation (Rn)
### Aliases: Rn

### ** Examples

# --------------------------------------------
#  Daily period
# --------------------------------------------

Rn(x = 105, n = 8.5, elev = 2, actVP = 2.85, Tmax = 34.8,
   Tmin = 25.6, lat.deg = 13.73)

Rn(x = 135, elev = 1, Rs = 14.5, Tmax = 25.1, Tmin = 19.1,
   lat.deg = -22.9, actVP = 2.1)

# --------------------------------------------
#  Hourly period
# --------------------------------------------

Rn(x = as.POSIXct(c('2018-10-01 14:30', '2018-10-01 15:30')), Tmean = c(38, 37.8),
   Rhmean = c(52, 52.2), Rs = c(2.450, 2.1), elev = 8, lat.deg = 16.2,
   long.deg = 343.75, control = list(Lz = 15))

Rn(x = as.POSIXct('2018-10-01 14:30'), Tmean = 38, Rhmean = 52, tl = 1, Rs = 2.450,
   elev = 8, lat.deg = 16.2, long.deg = 343.75, control = list(Lz = 15))




