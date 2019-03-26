library(chillR)


### Name: weather2chillR
### Title: Convert downloaded weather to chillR format
### Aliases: weather2chillR
### Keywords: utilities

### ** Examples


# All examples are disabled, because the database is sometimes unavailable. This then generates
# an error when R runs its package functionality checks. To run the examples, remove the # mark,
# before running the code.

#stat_list<-get_weather(location=c(lat=40,lon=-120,ele=150),time_interval=c(2015,2016),
#database="UCIPM")
#chillRcode<-stat_list[which(stat_list$Perc_interval_covered==
#max(stat_list$Perc_interval_covered)),"chillR_code"][1]
#chillRcode should equal "DOYLE.C" now.
#gw<-get_weather(location="DOYLE.C",time_interval=c(2002,2002),database="UCIPM")
#weather<-weather2chillR(gw$weather,"GSOD")
#weather<-weather2chillR(gw)




