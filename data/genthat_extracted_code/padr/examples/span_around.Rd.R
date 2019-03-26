library(padr)


### Name: span_around
### Title: Span an equally spaced vector around a datetime variable
### Aliases: span_around

### ** Examples

span_around(coffee$time_stamp, "hour")
span_around(coffee$time_stamp, "hour", end_shift = "2 hour")
span_around(coffee$time_stamp, "2 day")
span_around(coffee$time_stamp, "2 day", start_shift = "2 day")
span_around(emergency$time_stamp, "week")
span_around(emergency$time_stamp, "2 month")



