library(tibbletime)


### Name: floor_index
### Title: A simple wrapper of 'lubridate::floor_date()'
### Aliases: floor_index

### ** Examples


data(FB)
dplyr::mutate(FB, date2 = floor_index(date, "year"))

time_test <- create_series('00:00:00'~'12:00:00',
                           '1 minute', class = "hms")

dplyr::mutate(time_test, date2 = floor_index(date, "hour"))




