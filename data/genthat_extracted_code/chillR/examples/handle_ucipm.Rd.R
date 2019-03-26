library(chillR)


### Name: handle_ucipm
### Title: List, download or convert to chillR format data from the UCIPM
###   database
### Aliases: handle_ucipm
### Keywords: utilities

### ** Examples


# All examples are disabled, because the database is sometimes unavailable. This then generates
# an error when R runs its package functionality checks. To run the examples, remove the # mark,
# before running the code.
#
#handle_ucipm(action="list_stations",location=c(x=-122,y=38.5),time_interval=c(2012,2012))
#gw<-handle_ucipm(action="download_weather",location="WINTERS.A",time_interval=c(2012,2012))
#weather<-handle_ucipm(gw)$weather
#make_chill_plot(tempResponse(stack_hourly_temps(fix_weather(weather)),Start_JDay=300,End_JDay=50),
#                "Chill_Portions",start_year=2010,end_year=2012,metriclabel="Chill Portions",
#                misstolerance = 50)




