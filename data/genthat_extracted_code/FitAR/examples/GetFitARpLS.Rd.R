library(FitAR)


### Name: GetFitARpLS
### Title: LS for AR(p) and Subset ARp - Short Version
### Aliases: GetFitARpLS
### Keywords: ts

### ** Examples

#Fit subset AR using LS
#normally use FitAR
ans<-FitAR(SeriesA, c(1,2,7), ARModel="ARp", MLEQ=FALSE)
#could also use FitARp
ans<-FitARp(SeriesA, c(1,2,7))
#for some applications GetFitARpLS is simpler and faster
ansLS<-GetFitARpLS(SeriesA, c(1,2,7))
ansLS



