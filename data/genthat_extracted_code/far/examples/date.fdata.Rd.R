library(far)


### Name: date.fdata
### Title: Extract the date of fdata
### Aliases: date.fdata
### Keywords: ts misc

### ** Examples

# Reading the data
library(stats)
data(UKDriverDeaths)

# Conversion of the data
fUKDriverDeaths <- as.fdata(UKDriverDeaths,col=1,p=12,dates=1969:1984,
                            name="UK Driver Deaths")
date.fdata(fUKDriverDeaths)



