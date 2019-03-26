library(simPH)


### Name: SurvExpand
### Title: Convert a data frame of non-equal interval continuous
###   observations into equal interval continuous observations
### Aliases: SurvExpand
### Keywords: utilities

### ** Examples

# Load Golub & Steunenberg (2007) Data
data("GolubEUPData")

# Subset PURELY TO SPEED UP THE EXAMPLE
GolubEUPData <- GolubEUPData[1:500, ]

# Expand data
GolubEUPDataExpand <- SurvExpand(GolubEUPData, GroupVar = 'caseno',
                       Time = 'begin', Time2 = 'end', event = 'event')




