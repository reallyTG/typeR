library(LPM)


### Name: IDFcurve2
### Title: Intensity duration frequency curve for maximum annual rainfall
###   series of different duration
### Aliases: IDFcurve2

### ** Examples

##     ris=IDFcurve2(milano, 1, stvalue1 = 1, stvalue2 = 1, 
##     t=c(0.25,0.5,0.75,1,1.25,1.5,2,2.5,3,4,6), Tr = 200, MP=F)
## --> 2 parameters IDF curve estimation of annual maximum rainfall 
##     series recorded in Palazzo Marino - Milan (Italy)
##     ris=IDFcurve2(milano, 1, stvalue1 = 1, stvalue2 = 1, 
##     t=c(0.25,0.5,0.75,1,1.25,1.5,2,2.5,3,4,6), Tr = 200, MP=T)
## --> 3 parameters IDF curve estimation of annual maximum rainfall
##     series recorded in Palazzo Marino - Milan (Italy)
## --> It's obvious the best performance of the 3 parameters formula


