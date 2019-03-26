library(countytimezones)


### Name: add_local_time
### Title: Add local time to dataset
### Aliases: add_local_time

### ** Examples

ex_df <- data.frame(datetime = c("1999-01-01 08:00", "1999-01-01 09:00",
                                 "1999-01-01 10:00"),
                    fips = c("36061", "17031", "06037"))
add_local_time(df = ex_df, fips = ex_df$fips,
               datetime_colname = "datetime")

ex_df <- data.frame(datetime = c("1999-01-01 08:00", "1999-01-01 09:00",
                                 "1999-01-01 10:00"))
add_local_time(df = ex_df, fips = "36061", datetime_colname = "datetime")




