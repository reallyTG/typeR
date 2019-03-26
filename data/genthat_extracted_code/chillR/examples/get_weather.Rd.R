library(chillR)


### Name: get_weather
### Title: Download weather data from online database
### Aliases: get_weather
### Keywords: utilities

### ** Examples



#stat_list<-handle_gsod(action="list_stations",location=c(x=-122,y=38.5),
#  time_interval=c(2002,2002))
#the line above takes longer to run than CRAN allows for examples. The line below therefore
#generates an abbreviated stat_list that allows running the code.
stat_list<-data.frame(chillR_code=c("724828_99999","724828_93241","720576_174"),
   Lat=c(38.383,38.378,38.533),Long=c(-121.967,-121.958,-121.783),
   BEGIN=c(20010811,20060101,20130101),END=c(20051231,20160110,20160109))

gw<-get_weather(location="724828_93241",time_interval=c(2012,2012),database="GSOD",
  station_list = stat_list)

#stat_list<-get_weather(location=c(lat=50,lon=10,ele=150),time_interval=c(2001,2001),
#  database="UCIPM")
#chillRcode<-stat_list[which(stat_list$Perc_interval_covered==
#max(stat_list$Perc_interval_covered)),"chillR_code"][1]
  #after the first few lines here, the code should be "CEDARVIL.C"
#gw<-get_weather(location="CEDARVIL.C",time_interval=c(2001,2001),database="UCIPM")
#weather<-weather2chillR(gw,"GSOD")
#make_chill_plot(tempResponse(stack_hourly_temps(fix_weather(weather))),
#                "Chill_Portions",start_year=2005,end_year=2011,metriclabel="Chill Portions")




