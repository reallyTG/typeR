library(MMWRweek)


### Name: MMWRweekday
### Title: Day of week according to MMWR
### Aliases: MMWRweekday

### ** Examples

y <- as.Date(paste(1999:2011, "-12-31", sep = ""))
data.frame(date = format(y), MMWRweekday = MMWRweekday(y))



