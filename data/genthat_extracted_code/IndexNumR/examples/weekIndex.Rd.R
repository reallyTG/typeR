library(IndexNumR)


### Name: weekIndex
### Title: Generate an index of weeks
### Aliases: weekIndex

### ** Examples

# given a vector of dates
df <- data.frame(date = as.Date(c("2016-12-20","2016-12-27","2017-01-01","2017-01-07"),
format = "%Y-%m-%d"))
# calculate the time period variable
df$period <- weekIndex(df$date)
df



