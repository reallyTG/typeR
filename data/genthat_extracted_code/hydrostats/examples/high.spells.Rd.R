library(hydrostats)


### Name: high.spells
### Title: Calculates high flow spell statistics
### Aliases: high.spells

### ** Examples


data(Cooper)
Cooper<-ts.format(Cooper)

high.spells(Cooper, quant=0.9)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, plot=FALSE)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, ignore.zeros=TRUE)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, ignore.zeros=TRUE, hydro.year=TRUE)

require(plyr)
Cooper$year<-strftime(Cooper$Date, format="%Y")
ddply(Cooper, .(year), function(x) high.spells(x, ann.stats=FALSE))

Cooper$time.period <- ifelse(Cooper$year<1980,"pre_1980","post_1980")

ddply(Cooper, .(time.period), function(x) high.spells(x, ann.stats=FALSE))




