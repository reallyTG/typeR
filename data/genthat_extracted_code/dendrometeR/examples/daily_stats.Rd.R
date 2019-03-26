library(dendrometeR)


### Name: daily_stats
### Title: Calculate daily statistics for dendrometer and environmental
###   data
### Aliases: daily_stats

### ** Examples

data(dmCD)
dm.daily <- daily_stats(dmCD, sensor = 1)

data(dmED)
dm.daily <- daily_stats(dmED, sensor = "ALL", value = "max")




