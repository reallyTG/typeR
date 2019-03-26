library(iemisc)


### Name: Manningtri
### Title: Triangular cross-section for the Gauckler-Manning-Strickler
###   equation
### Aliases: Manningtri

### ** Examples

library(iemisc)
library(iemiscdata)
# Practice Problem 14.41 from Mott (page 393)
# See nchannel in iemiscdata for the Manning's n table that the
# following example uses
# Use the normal Manning's n value for 1) Natural streams - minor streams
# (top width at floodstage < 100 ft), 2) Excavated or Dredged Channels, 3)
# Earth, straight, and uniform, 4) clean, recently completed.

data(nchannel)

nlocation <- grep("clean, recently completed",
nchannel$"Type of Channel and Description")

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n

Manningtri(Q = 0.68, m = 1.5, Sf = 0.0023, n = n, units = "Eng")
# Q = 0.68 cfs, m = 1.5, Sf = 0.002 ft/ft, n = 0.05, units = English units
# This will solve for y since it is missing and y will be in ft



# Modified Exercise 4.1 from Sturm (page 153)
Manningtri(Q = 3000, m = 3, Sf = 0.002, n = 0.025, units = "Eng")
# Q = 3000 cfs, m = 3, Sf = 0.002 ft/ft, n = 0.025, units = English units
# This will solve for y since it is missing and y will be in ft



# Modified Exercise 4.5 from Sturm (page 154)
Manningtri(Q = 950, m = 2, Sf = 0.022, n = 0.023, units = "SI")
# Q = 950 m^3/s, m = 2, Sf = 0.022 m/m, n = 0.023, units = SI units
# This will solve for y since it is missing and y will be in m




