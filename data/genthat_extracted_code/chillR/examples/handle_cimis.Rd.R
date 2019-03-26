library(chillR)


### Name: handle_cimis
### Title: List, download or convert to chillR format data from the CIMIS
###   database
### Aliases: handle_cimis
### Keywords: utilities

### ** Examples


#handle_cimis(action="list_stations",location=c(x=-122,y=38.5),time_interval=c(2012,2012))

stat_list<-data.frame("Station Number"=c("119","139","6"),
   Latitude=c(38.49500,38.50126,38.53569),Longitude=c(-122.0040,-121.9785,-121.7764),
   Start_date=c("1993-08-21 UTC","1998-06-15 UTC","1982-07-17 UTC"),End_date=c("1995-01-25",
     "2016-03-06","2016-03-06"))

gw<-handle_cimis(action="download_weather",location="6",time_interval=c(1982,1982),
  station_list=stat_list)
weather<-handle_cimis(gw)
#make_chill_plot(tempResponse(stack_hourly_temps(fix_weather(weather)),Start_JDay=300,End_JDay=50),
#                "Chill_Portions",start_year=2010,end_year=2012,metriclabel="Chill Portions",
#misstolerance = 50)




