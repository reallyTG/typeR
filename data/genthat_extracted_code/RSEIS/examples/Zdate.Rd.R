library(RSEIS)


### Name: Zdate
### Title: Date functions
### Aliases: Zdate dateList dateStamp
### Keywords: misc

### ** Examples

data("GH")

sel <-  which(GH$COMPS == "V")

ftime  <-  Zdate(GH$info, sel[1:5], 1)

dvec  <-  c(2009, 134, 5, 14, 10, 32, 24.5, 0)
A  <-  dateList(dvec)
dateStamp(A)

dateStamp(A, sep="_")






