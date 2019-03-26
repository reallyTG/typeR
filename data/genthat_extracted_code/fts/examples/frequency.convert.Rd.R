library(fts)


### Name: frequency.convert
### Title: Change Frequencies
### Aliases: frequency.convert to.weekly to.day.of.week to.monthly
###   to.quarterly to.daily to.hourly to.minute to.second to.yearly
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=500),data=1:500)

to.weekly(x)
to.monthly(x)
to.quarterly(x)



