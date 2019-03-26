library(bsts)


### Name: date.range
### Title: Date Range
### Aliases: DateRange
### Keywords: chron

### ** Examples


holiday <- NamedHoliday("MemorialDay", days.before = 2, days.after = 2)
timestamps <- seq.Date(from = as.Date("2001-01-01"), by = "day",
   length.out = 365 * 10)
influence <- DateRange(holiday, timestamps)




