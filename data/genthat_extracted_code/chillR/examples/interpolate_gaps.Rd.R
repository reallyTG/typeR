library(chillR)


### Name: interpolate_gaps
### Title: Linear gap interpolation
### Aliases: interpolate_gaps
### Keywords: utility

### ** Examples


weather<-make_all_day_table(KA_weather)
Tmin_int<-interpolate_gaps(KA_weather[,"Tmin"])
weather[,"Tmin"]<-Tmin_int$interp
weather[,"Tmin_interpolated"]<-Tmin_int$missing

Tmax_int<-interpolate_gaps(KA_weather[,"Tmax"])
weather[,"Tmax"]<-Tmax_int$interp
weather[,"Tmax_interpolated"]<-Tmax_int$missing

#this function is integrated into the fix_weather function, but it can also be run on its own.





