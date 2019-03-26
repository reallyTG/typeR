library(padr)


### Name: span_time
### Title: Wrapper around 'seq.POSIXct'.
### Aliases: span_time

### ** Examples

# using to
span_time(2011, 2013)
span_time("2011", "2013")
span_time(2011, 201301)
span_time(2011, 20130101)
span_time(2011, "20110101 0023")
span_time(2011, "20110101 002300")

# using len_out
span_time(2011, len_out = 3)
span_time("2011", len_out = 3)
span_time(2011, len_out = 10, by = "month")
span_time(2011, len_out = 10, by = "day")
span_time(2011, len_out = 10, by = "hour")
span_time("20110101 00", len_out = 10)
span_time("20110101 002300", len_out = 10)




