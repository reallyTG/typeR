library(seas)


### Name: year.length
### Title: Calculate the number of days in a year
### Aliases: year.length
### Keywords: utilities datagen ts

### ** Examples

cal <- data.frame(year=c(1899, 1900, 1904, 2000, 2080, 2100))
cal[["Gregorian"]] <- year.length(cal$year)
cal[["Julian"]] <- year.length(cal$year, "julian")
cal[["360_day"]] <- year.length(cal$year, "360_day")
cal[["365_day"]] <- year.length(cal$year, "365_day")
cal[["366_day"]] <- year.length(cal$year, "366_day")

cal



