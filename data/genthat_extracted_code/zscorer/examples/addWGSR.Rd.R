library(zscorer)


### Name: addWGSR
### Title: addWGSR
### Aliases: addWGSR

### ** Examples

# Calculate weight-for-height (wfh) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "weight",
        secondPart = "height",
        index = "wfh")

# Calculate weight-for-age (wfa) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "weight",
        secondPart = "age",
        index = "wfa")

# Calculate height-for-age (hfa) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "height",
        secondPart = "age",
        index = "hfa")




