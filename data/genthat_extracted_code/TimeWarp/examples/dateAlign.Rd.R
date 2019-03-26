library(TimeWarp)


### Name: dateAlign
### Title: Date alignment
### Aliases: dateAlign
### Keywords: utilities

### ** Examples

dateAlign("2007/12/06", by = "days", k.by = 4, direction = -1)
date <- as.Date("2009/1/1") + -5:5
dateAlign(date, by = "days", silent = FALSE)
dateAlign(date, by = "days", k.by = 3, direction = -1)
dateAlign(date, by = "bizdays", k.by = 1, direction = 1)
library(Holidays)
dateAlign(date, by = "bizdays", k.by = 1, direction = 1, holidays =
"NYSEC")
dateAlign(date, by = "months", k.by = 2, direction = -1)
dateAlign(date, by = "years", k.by = 3, direction = -1)



