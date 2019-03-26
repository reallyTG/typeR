library(zscorer)


### Name: getWGSR
### Title: getWGSR
### Aliases: getWGSR

### ** Examples

# Given a male child 10 months old with a weight of 5.7 kgs, height of 64.2
# cms, and MUAC of 125 mm:
#
# Calculate weight-for-height
getWGSR(sex = 1,
        firstPart = 5.7,
        secondPart = 64.2,
        index = "wfh",
        standing = 3)

# calculate weight-for-age
getWGSR(sex = 1,
        firstPart = 5.7,
        secondPart = 10,
        index = "wfa",
        standing = 3)

# calculate height-for-age
getWGSR(sex = 1,
        firstPart = 64.2,
        secondPart = 10,
        index = "hfa",
        standing = 3)




