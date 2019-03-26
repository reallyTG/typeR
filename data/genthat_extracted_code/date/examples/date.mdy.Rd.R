library(date)


### Name: date.mdy
### Title: Convert from Julian Dates to Month, Day, and Year
### Aliases: date.mdy
### Keywords: chron

### ** Examples

day <- 7
temp <- date.mdy(mdy.date(month = 7, day = day, year = 1960))
## Check for illegal dates, such as 29 Feb in a non leap year
if (temp$day != day) {
  cat("Some illegal dates\n")
} else {
  cat("All days are legal\n")
}



