library(IndexNumR)


### Name: monthIndex
### Title: Generate an index of months
### Aliases: monthIndex

### ** Examples

# given a vector of dates
df <- data.frame(date = as.Date(c("2017-01-01","2017-02-01","2017-03-01","2017-04-01"),
format = "%Y-%m-%d"))
# calculate the time period variable
df$period <- monthIndex(df$date)
df



