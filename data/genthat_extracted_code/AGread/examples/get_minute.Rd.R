library(AGread)


### Name: get_minute
### Title: Numerical Minute of the Day.
### Aliases: get_minute

### ** Examples

key_times <-
    paste("2018-03-15",
          c("00:00:00",
            "01:00:00",
            "12:00:00",
            "23:59:59"))

get_minute(key_times)
get_minute(key_times, rational = TRUE)




