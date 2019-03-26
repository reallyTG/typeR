library(hydrostats)


### Name: low.spells
### Title: Calculate low flow spell statistics
### Aliases: low.spells

### ** Examples


data(Cooper)
Cooper<-ts.format(Cooper)

low.spells(Cooper, quant=0.1)

low.spells(Cooper, quant=0.1, hydro.year=TRUE)

#generate results for each year
Cooper$year<-strftime(Cooper$Date, format="%Y")

require(plyr)
ddply(Cooper, .(year), function(x) low.spells(x, threshold=20, ann.stats=FALSE))

#generate seperate results prior to 1980.
Cooper$time.period<-ifelse(Cooper$year<1980,"pre_1980","post_1980")
ddply(Cooper, .(time.period), function(x) low.spells(x, threshold=20, ann.stats=FALSE))




