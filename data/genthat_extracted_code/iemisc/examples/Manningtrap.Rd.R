library(iemisc)


### Name: Manningtrap
### Title: Trapezoidal cross-section for the Gauckler-Manning-Strickler
###   equation
### Aliases: Manningtrap

### ** Examples

library(iemisc)
library(iemiscdata)
# Exercise 4.1 from Sturm (page 153)

Manningtrap(Q = 3000, b = 40, m = 3, Sf = 0.002, n = 0.025, units = "Eng")
# Q = 3000 cfs, b = 40 ft, m = 3, Sf = 0.002 ft/ft, n = 0.025,
# units = English units
# This will solve for y since it is missing and y will be in ft



# Practice Problem 14.19 from Mott (page 392)
# See nchannel in iemiscdata for the Manning's n table that the following
# example uses
# Use the minimum Manning's n value for 1) Natural streams - minor streams
# (top width at floodstage < 100 ft), 2) Lined or Constructed Channels,
# 3) Concrete and 4) float finish.

data(nchannel)

nlocation <- grep("float finish",
nchannel$"Type of Channel and Description")

n <- nchannel[nlocation, 3][1] # 3 for column 3 - Normal n

Manningtrap(y = 1.5, b = 3, m = 3/2, Sf = 0.1/100, n = n, units = "SI")
# y = 1.5 m, b = 3 m, m = 3/2, Sf = 0.1/100 m/m, n = 0.023, units = SI
# units
# This will solve for Q since it is missing and Q will be in m^3/s





