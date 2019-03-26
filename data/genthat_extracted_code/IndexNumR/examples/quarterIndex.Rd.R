library(IndexNumR)


### Name: quarterIndex
### Title: Generate an index of quarters
### Aliases: quarterIndex

### ** Examples

# given a vector of dates
df <- data.frame(date = as.Date(c("2017-01-01","2017-04-01","2017-07-01","2017-08-01"),
format = "%Y-%m-%d"))
# calculate the time period variable
df$period <- quarterIndex(df$date)
df



