library(IndexNumR)


### Name: yearIndex
### Title: Generate an index of years
### Aliases: yearIndex

### ** Examples

# given a vector of dates
df <- data.frame(date = as.Date(c("2017-01-01","2018-04-01","2019-07-01","2019-08-01"),
format = "%Y-%m-%d"))
# calculate the time period variable
df$period <- yearIndex(df$date)
df



