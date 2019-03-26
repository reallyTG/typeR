library(MeTo)


### Name: Rso
### Title: Clear-sky solar radiation (Rso)
### Aliases: Rso

### ** Examples

# --------------------------------------------
#  Daily period
# --------------------------------------------

Rso(x = 135, elev = 1, lat.deg = -22.9)

# --------------------------------------------
#  Hourly period
# --------------------------------------------

Rso(x = as.POSIXct('2018-10-01 12:30'), tl = 1, elev = 8, lat.deg = 16.2,
    long.deg = 343.75, control = list(Lz = 15))




