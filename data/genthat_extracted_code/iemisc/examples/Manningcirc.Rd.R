library(iemisc)


### Name: Manningcirc
### Title: Circular cross-section using the Gauckler-Manning-Strickler
###   equation
### Aliases: Manningcirc Manningcirc Manningcircy

### ** Examples

library(iemisc)
library(iemiscdata)

# Practice Problem 14.12 from Mott (page 392)
y <- Manningcircy(y_d = 0.5, d = 6, units = "Eng")

# See npartfull in iemiscdata for the Manning's n table that the
# following example uses
# Use the normal Manning's n value for 1) Corrugated Metal, 2) Stormdrain.

data(npartfull)

# We are using the culvert as a stormdrain in this problem
nlocation <- grep("Stormdrain",
npartfull$"Type of Conduit and Description")

n <- npartfull[nlocation, 3] # 3 for column 3 - Normal n

Manningcirc(d = 6, Sf = 1 / 500, n = n, y = y$y, units = "Eng")
# d = 6 ft, Sf = 1 / 500 ft/ft, n = 0.024, y = 3 ft, units = "Eng"
# This will solve for Q since it is missing and Q will be in ft^3/s



# Example Problem 14.2 from Mott (page 377-378)
y <- Manningcircy(y_d = 0.5, d = 200/1000, units = "SI")

# See npartfull in iemiscdata for the Manning's n table that the
# following example uses
# Use the normal Manning's n value for 1) Clay, 2) Common drainage tile.

data(npartfull)

nlocation <- grep("Common drainage tile",
npartfull$"Type of Conduit and Description")

n <- npartfull[nlocation, 3] # 3 for column 3 - Normal n

Manningcirc(Sf = 1/1000, n = n, y = y$y, d = 200/1000, units = "SI")
# Sf = 1/1000 m/m, n = 0.013, y = 0.1 m, d = 200/1000 m, units = SI units
# This will solve for Q since it is missing and Q will be in m^3/s



# Example 4.1 from Sturm (page 124-125)
Manningcircy(y_d = 0.8, d = 2, units = "Eng")

y <- Manningcircy(y_d = 0.8, d = 2, units = "Eng")
# defines all list values within the object named y

y$y # gives the value of y



# Modified Exercise 4.1 from Sturm (page 153)
# Note: The Q in Exercise 4.1 is actually found using the Chezy equation,
# this is a modification of that problem
# See nchannel in iemiscdata for the Manning's n table that the
# following example uses
# Use the normal Manning's n value for 1) Natural streams - minor streams
# (top width at floodstage < 100 ft), 2) Mountain streams, no vegetation
# in channel, banks usually steep, trees and brush along banks submerged at
# high stages and 3) bottom: gravels, cobbles, and few boulders.

data(nchannel)

nlocation <- grep("bottom: gravels, cobbles, and few boulders",
nchannel$"Type of Channel and Description")

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n

Manningcirc(Sf = 0.002, n = n, y = y$y, d = 2, units = "Eng")
# Sf = 0.002 ft/ft, n = 0.04, y = 1.6 ft, d = 2 ft, units = English units
# This will solve for Q since it is missing and Q will be in ft^3/s



# Modified Exercise 4.5 from Sturm (page 154)
library(NISTunits)

ysi <- NISTftTOmeter(y$y)

dsi <- NISTftTOmeter(2)

Manningcirc(Sf = 0.022, n = 0.023, y = ysi, d = dsi, units = "SI")
# Sf = 0.022 m/m, n = 0.023, y = 0.48768 m, d = 0.6096 m, units = SI units
# This will solve for Q since it is missing and Q will be in m^3/s





