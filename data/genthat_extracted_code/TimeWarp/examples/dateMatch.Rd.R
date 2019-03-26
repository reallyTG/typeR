library(TimeWarp)


### Name: dateMatch
### Title: Match Dates in a Table
### Aliases: dateMatch
### Keywords: utilities

### ** Examples

d1 <- dateParse(c("2001/01/10", "2001/03/12"))
d2 <- dateSeq(dateParse("2001/01/01"), by = "weeks", len = 20)
dateMatch(d1, dateParse(), how = "nearest", error.how = "drop")
dateMatch(d1, dateParse(), how = "nearest", error.how = "stop")
dateMatch(d1, dateParse(), how = "nearest.stop")
dateMatch(d1, d2, how = "after")
dateMatch(d1, d2, how = "after", offset = -3)
dateMatch(dateParse(c("2001/01/10", "2001/01/17", "2001/03/12")),
dateSeq(dateParse("2001/01/01"), by = "weeks", len = 20), how = "after",
offset = 10, value = TRUE)



