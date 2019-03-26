library(marelac)


### Name: convert_salinity
### Title: Practical - Absolute Salinity Conversions
### Aliases: convert_PStoAS convert_AStoPS
### Keywords: utilities

### ** Examples

# check values: should be 35.7
convert_PStoAS(S = 35.52764437773386, p = 102.3, lon = 201, lat = -21)

# check values: should be 35.52764437773386
convert_AStoPS(S = 35.7, p = 102.3, lon = 201, lat = -21)

#
convert_PStoAS(S = 35)
convert_AStoPS(S = 35)
convert_PStoAS(S = 35, lat = 10, lon = 10, p = 0)

# Based on Si concentration
DSi <- seq(from = 0, to = 200, by = 10)
Global   <-  convert_PStoAS(30, DSi = DSi, Ocean = "Global")
Atlantic <-  convert_PStoAS(30, DSi = DSi, Ocean = "Atlantic", lat = 0)
Pacific  <-  convert_PStoAS(30, DSi = DSi, Ocean = "Pacific", lat = 0)
Indian   <-  convert_PStoAS(30, DSi = DSi, Ocean = "Indian", lat = 0)
Southern <-  convert_PStoAS(30, DSi = DSi, Ocean = "Southern")

matplot(x = DSi, y = cbind(Global, Atlantic, Pacific, Indian, Southern),
  pch = 1, xlab = "DSi, micromol/kg", ylab = "Absolute salinity (PS=30)")
legend("topleft",c("Global", "Atlantic", "Pacific", "Indian", "Southern"),
       col = 1:5, pch = 1)



