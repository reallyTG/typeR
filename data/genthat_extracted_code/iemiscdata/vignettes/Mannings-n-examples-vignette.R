## ------------------------------------------------------------------------
library(install.load)
load_package("iemiscdata", "data.table", "rivr") # load needed packages using the load_package function from the install.load package (it is assumed that you have already installed these packages)


# Use grep to find the row number matching the given description
# Use nchannel$"Type of Channel and Description" to select the column to search through
# Use nchannel[nlocation, 4] to select the row number from nlocation and column 4
# Similar steps are performed for each of these examples


# Example 1
# What is the maximum Manning's n value for a channel that has the following classification: "Natural streams - minor streams (top width at floodstage < 100 ft), Mountain streams, no vegetation in channel, banks usually steep, trees and brush along banks submerged at high stages and bottom: gravels, cobbles, and few boulders"?
# The 1st heading is "Manning's n for Channels"
# The 2nd heading is "Natural streams - minor streams (top width at floodstage < 100 ft)"
# The 3rd heading is "Mountain streams, no vegetation in channel, banks usually steep, trees and brush along banks submerged at high stages"
# The 4th heading is "bottom: gravels, cobbles, and few boulders"

data(nchannel)

nlocation <- grep("bottom: gravels, cobbles, and few boulders", nchannel$"Type of Channel and Description")

nlocation


n <- nchannel[nlocation, 4] # 4 for column 4 - Maximum n

n




# Example 2
# What is the minimum Manning's n value for a channel that has the following classification: "Closed Conduits Flowing Partly Full, Wood and Stave"?
# The 1st heading is "Manning's n for Closed Conduits Flowing Partly Full"
# The 2nd heading is "Wood"
# The 3rd heading is "Stave"

data(npartfull)

nlocation <- grep("Stave", npartfull$"Type of Conduit and Description")

nlocation


n <- npartfull[nlocation, 2] # 2 for column 2 - Minimum n

n




# Example 3
# What is the Manning's n value for a channel that has the following classification: "Corrugated Metal Pipe, Corrugations 6x2 inches and 60" diameter"?
# The 1st heading is "Manning's n for Corrugated Metal Pipe"
# The 2nd heading is "Corrugations 6x2 inches"
# The 3rd heading is "60" diameter"

data(nmetalpipe)

nnear <- grep("Corrugations 6x2 inches", nmetalpipe$"Type of Pipe, Diameter and Corrugation Dimension")
# nnear is the row number matching the description
nnear


nlocation <- nlocation[which(grep("60\"\" diameter", nmetalpipe$"Type of Pipe, Diameter and Corrugation Dimension") > nnear)]
# which provides all locations matching the description > nnear gives the row number(s) greater than nnear since the requested diameter is in the section located after nnear
nlocation


n <- nmetalpipe[nlocation, 2] # 2 for column 2 - n

n




# Example 4
# Example to compute the "gradually-varied flow profile of a prismatic channel" with these channel conditions used to find Manning's n (normal): "Natural streams - minor streams (top width at floodstage < 100 ft), Excavated or Dredged Channels, Earth, straight, and uniform, & clean, recently completed".
# Quote source: rivr's compute_profile

# The 1st heading is "Manning's n for Channels"
# The 2nd heading is "Natural streams - minor streams (top width at floodstage < 100 ft)"
# The 3rd heading is "Excavated or Dredged Channels"
# The 4th heading is "Earth, straight, and uniform"
# The 5th heading is "clean, recently completed"


# Using the data for the M1 profile example in rivr's compute_profile, except for the value of n to find the channel condition

nlocation <- grep("clean, recently completed", nchannel$"Type of Channel and Description")
# use grep to find the n's row number

nlocation


n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n

n


compute_profile(0.001, n, 250, 2.7, 1.486, 32.2, 100, 0, stepdist = 50, totaldist = 3000)

