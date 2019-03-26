library(chron)


### Name: dates
### Title: Generate Dates and Times Components from Input
### Aliases: dates times Math.dates Ops.dates Summary.dates [<-.dates
###   all.equal.dates as.data.frame.dates c.dates floor.dates format.dates
###   print.dates trunc.dates Math.times Ops.times Summary.times [.times
###   [<-.times [[.times as.character.times as.data.frame.times axis.times
###   c.times diff.times format.times format<-.times hist.times
###   identify.times is.na.times lines.times mean.times plot.times
###   points.times print.times quantile.times summary.times
### Keywords: chron

### ** Examples

dts <- dates(c("02/27/92", "02/27/92", "01/14/92",
               "02/28/92", "02/01/92"))
dts
# [1] 02/27/92 02/27/92 01/14/92 02/28/92 02/01/92
class(dts)

x <- chron(dates = c("02/27/92", "02/27/92", "01/14/92", "02/28/92"),
           times = c("23:03:20", "22:29:56", "01:03:30", "18:21:03"))
dates(x)
# [1] 02/27/92 02/27/92 01/14/92 02/28/92



