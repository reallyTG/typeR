library(newTestSurvRec)


### Name: Plot.Cusum.Events
### Title: Plot data with recurrent events
### Aliases: Plot.Cusum.Events
### Keywords: plot Events

### ** Examples
XL<-data(TBCplapyr)
 #TBCplapyr
 # See, the unit number 1 to 24
 Plot.Cusum.Events(TBCplapyr,1,24,"green","red",2,1)
 # See, the unit number 10 to 12
 Plot.Cusum.Events(TBCplapyr,10,12,"pink","blue",1,3)
 # See, the unit number 5 to 9
 Plot.Cusum.Events(TBCplapyr,5,11,,,2,3)



