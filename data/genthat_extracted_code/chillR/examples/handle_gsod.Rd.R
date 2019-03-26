library(chillR)


### Name: handle_gsod
### Title: List, download or convert to chillR format data from the Global
###   Summary of the Day database
### Aliases: handle_gsod
### Keywords: utilities

### ** Examples


#stat_list<-handle_gsod(action="list_stations",location=c(x=-122,y=38.5),
#  time_interval=c(2002,2002))
#the line above takes longer to run than CRAN allows for examples. The line below therefore
#generates an abbreviated stat_list that allows running the code.
stat_list<-data.frame(chillR_code=c("724828_99999","724828_93241","720576_174"),
   Lat=c(38.383,38.378,38.533),Long=c(-121.967,-121.958,-121.783),
   BEGIN=c(20010811,20060101,20130101),END=c(20051231,20160110,20160109))

gw<-handle_gsod(action="download_weather",location="724828_93241",time_interval=c(2012,2012),
  station_list = stat_list)
weather<-handle_gsod(gw)$weather
#make_chill_plot(tempResponse(stack_hourly_temps(fix_weather(weather)),Start_JDay=300,End_JDay=50),
#                "Chill_Portions",start_year=2010,end_year=2012,metriclabel="Chill Portions",
#misstolerance = 50)




