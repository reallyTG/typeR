library(FitAR)


### Name: SeriesA
### Title: Series A, Chemical Process Concentration Readings
### Aliases: SeriesA
### Keywords: datasets

### ** Examples

data(SeriesA)
#fit subset models
FitAR(SeriesA, c(1,2,7), ARModel="ARp")
FitAR(SeriesA, c(1,2,6,7), ARModel="ARz")



