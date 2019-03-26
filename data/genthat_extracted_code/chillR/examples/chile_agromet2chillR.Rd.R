library(chillR)


### Name: chile_agromet2chillR
### Title: Convert a weather file downloaded from the Chilean Agromet
###   website to chillR format
### Aliases: chile_agromet2chillR
### Keywords: utilities

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2005),])  # this line is
#only here to make the example run, even without downloading a file

# FOLLOW THE INSTRUCTIONS IN THE LINE BELOW THIS; AND THEN  RUN THE LINE AFTER THAT (without the #)
# download an Excel file from the website and save it to disk (path: {X}) 
#weather<-fix_weather(chile_agromet2chillR({x}))

hourtemps<-stack_hourly_temps(weather, latitude=50.4)
chilling(hourtemps,305,60)




