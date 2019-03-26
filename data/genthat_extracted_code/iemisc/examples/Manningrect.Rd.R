library(iemisc)


### Name: Manningrect
### Title: Rectangular cross-section for the Gauckler-Manning-Strickler
###   equation
### Aliases: Manningrect

### ** Examples

library(iemisc)
library(iemiscdata)
# Example Problem 14.4 from Mott (page 379)
# See nchannel in iemiscdata for the Manning's n table that the following
# example uses
# Use the normal Manning's n value for 1) Natural streams - minor streams
# (top width at floodstage < 100 ft), 2) Lined or Constructed Channels,
# 3) Concrete, and 4) unfinished.

data(nchannel)

nlocation <- grep("unfinished", nchannel$"Type of Channel and Description")

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n

Manningrect(Q = 5.75, b = (4.50) ^ (3 / 8), Sf = 1.2/100, n = n, units =
"SI")
# Q = 5.75 m^3/s, b = (4.50) ^ (3 / 8) m, Sf = 1.2 percent m/m, n = 0.017,
# units = SI units
# This will solve for y since it is missing and y will be in m



# Example Problem 14.5 from Mott (page 379-380)
# See nchannel in iemiscdata for the Manning's n table that the following
# example uses
# Use the normal Manning's n value for 1) Natural streams - minor streams
# (top width at floodstage < 100 ft), 2) Lined or Constructed Channels,
# 3) Concrete, and 4) unfinished.

data(nchannel)

nlocation <- grep("unfinished", nchannel$"Type of Channel and Description")

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n

Manningrect(Q = 12, b = 2, Sf = 1.2/100, n = n, units = "SI")
# Q = 12 m^3/s, b = 2 m, Sf = 1.2 percent m/m, n = 0.017, units = SI
# units
# This will solve for y since it is missing and y will be in m





