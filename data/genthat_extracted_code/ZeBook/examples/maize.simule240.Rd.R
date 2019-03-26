library(ZeBook)


### Name: maize.simule240
### Title: Wrapper function to run Maize model multiple times for multiple
###   sets of parameter values and give Biomass at day240
### Aliases: maize.simule240

### ** Examples

sy="18-2006"
weather = maize.weather(working.year=strsplit(sy,"-")[[1]][2],
  working.site=strsplit(sy,"-")[[1]][1],weather_all=weather_EuropeEU)
maize.simule240(maize.define.param(),weather, sdate=100, ldate=250, all=FALSE)



