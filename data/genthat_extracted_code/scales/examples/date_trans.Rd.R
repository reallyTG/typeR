library(scales)


### Name: date_trans
### Title: Transformation for dates (class Date).
### Aliases: date_trans

### ** Examples

years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
t <- date_trans()
t$transform(years)
t$inverse(t$transform(years))
t$format(t$breaks(range(years)))



