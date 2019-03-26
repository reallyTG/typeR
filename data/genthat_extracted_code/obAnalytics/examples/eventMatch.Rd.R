library(obAnalytics)


### Name: eventMatch
### Title: Match Market Orders (takers) to Limit Orders (makers).
### Aliases: eventMatch
### Keywords: internal

### ** Examples


asTime <- function(s) as.POSIXct(s, tz="UTC")
events <- data.frame(timestamp=c(asTime("2015-10-10 21:32:00.000"),
                                 asTime("2015-10-10 21:32:00.010"),
                                 asTime("2015-10-10 21:32:10.000"),
                                 asTime("2015-10-10 21:32:10.010")),
                      direction=c("bid", "ask", "bid", "ask"),
                      event.id=c(1, 2, 3, 4),
                      fill=rep(1234, 4))
matched <- obAnalytics:::eventMatch(events, cut.off.ms=1000)




