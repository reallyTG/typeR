library(chillR)


### Name: patch_daily_temperatures
### Title: Patch gaps in daily weather records
### Aliases: patch_daily_temperatures
### Keywords: ~kwd1 ~kwd2

### ** Examples


gap_weather<-KA_weather[1:100,]
gap_weather[c(3,4,7:15,20,22:25,27:28,35:45,55,67,70:75,80:88,95:97),"Tmin"]<-NA
gap_weather[c(10:25,30,36:44,50,57,65,70:80,86,91:94),"Tmax"]<-NA
p1<-KA_weather[65:95,]
p1$Tmin<-p1$Tmin-2
p2<-KA_weather[c(15:40,60:80),]
p2$Tmax<-p2$Tmax+3
p3<-KA_weather[12:35,]
p3$Tmax<-p3$Tmax-2
p4<-KA_weather
p4$Tmax<-p4$Tmax+0.5
patch_weather<-list(stat1=p1,st2=p2,home=p3,last=p4)

patched<-patch_daily_temperatures(gap_weather,patch_weather,max_mean_bias=1)





