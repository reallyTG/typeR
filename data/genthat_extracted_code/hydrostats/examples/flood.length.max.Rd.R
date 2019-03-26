library(hydrostats)


### Name: flood.length.max
### Title: Calculates the maximum flood length in a time series.
### Aliases: flood.length.max

### ** Examples


data(Cooper)
Cooper<-ts.format(Cooper)

flood.length.max(Cooper, threshold = 50000, ind.days = 5)

# Return annual maximum flood length based on calendar year using ddply (from plyr package) 
require(plyr)
Cooper$Year=format(Cooper$Date, format="%Y")
ddply(Cooper, .(Year), flood.length.max, threshold = 50000)

require(dplyr)
Cooper %>%
dplyr::group_by(Year) %>%
dplyr::do(flood.length.max(., threshold = 50000))


# Based on hydrologic year.
Cooper<-hydro.year(Cooper)
plyr::ddply(Cooper, .(Year), flood.length.max, threshold = 50000)




