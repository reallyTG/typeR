library(abd)


### Name: SpiderSpeed
### Title: Spider Running Speeds after Amputation
### Aliases: SpiderSpeed
### Keywords: datasets

### ** Examples

xyplot(speed.after ~ speed.before, SpiderSpeed)
favstats(SpiderSpeed$speed.before)
favstats(SpiderSpeed$speed.after)
favstats(SpiderSpeed$speed.after - SpiderSpeed$speed.before)



