library(MeTo)


### Name: Ra
### Title: Extraterrestrial radiation
### Aliases: Ra

### ** Examples

# --------------------------------------------
#  Daily period
# --------------------------------------------

Ra(x = 105, lat.deg = 13.73)

# --------------------------------------------
#  Hourly period
# --------------------------------------------

Ra(x = as.POSIXct(c('2018-10-01 14:30', '2018-10-01 15:30')),
   lat.deg = 16.21, long.deg = 343.75, control = list(Lz = 15))

Ra(x = as.POSIXct('2018-10-01 14:30'), tl = 1,
   lat.deg = 16.21, long.deg = 343.75, control = list(Lz = 15))




