library(FitAR)


### Name: coef.FitAR
### Title: Display Estimated Parameters from Output of "FitAR"
### Aliases: coef.FitAR
### Keywords: ts

### ** Examples

# Fit subset AR to SeriesA
 outA<-FitAR(SeriesA, c(1,2,7), ARModel="ARz")
 coef(outA)
#
 outALS<-FitAR(SeriesA, c(1,2,7), ARModel="ARp")
 coef(outALS)




