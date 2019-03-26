library(LPM)


### Name: IDFcurve
### Title: Intensity duration frequency curve
### Aliases: IDFcurve

### ** Examples

##    res = IDFcurve(hourly.rainfall.series ,24, 15, 1, fre=1, Tr=200, MP=F)
## --> 2 parameters IDF curve estimation of a hourly rainfall series applying
## --> a Threshold "15 mm"  and Time of concentration t=1 h
##    res = IDFcurve(hourly.rainfall.series ,24, 15, 1, fre=1, Tr=200, MP=T)
## --> 3 parameters IDF curve estimation of a hourly rainfall series applying
## --> a Threshold "15 mm"  and Time of concentration t=1 h
## --> It's obvious the best performance of the 3 parameters formula


