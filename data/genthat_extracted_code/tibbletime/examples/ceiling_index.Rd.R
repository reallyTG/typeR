library(tibbletime)


### Name: ceiling_index
### Title: A simple wrapper of 'lubridate::ceiling_date()'
### Aliases: ceiling_index

### ** Examples


data(FB)
dplyr::mutate(FB, date2 = ceiling_index(date, "year"))

time_test <- create_series('00:00:00'~'12:00:00',
                           '1 minute', class = "hms")

dplyr::mutate(time_test, date2 = ceiling_index(date, "hour"))




