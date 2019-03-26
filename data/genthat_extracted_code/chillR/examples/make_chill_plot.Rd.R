library(chillR)


### Name: make_chill_plot
### Title: Plot climate metrics over time
### Aliases: make_chill_plot
### Keywords: utility

### ** Examples


make_chill_plot(tempResponse(stack_hourly_temps(fix_weather(KA_weather[KA_weather$Year>2005,]))),
"Chill_Portions",start_year=1990,end_year=2010,metriclabel="Chill Portions")

 



