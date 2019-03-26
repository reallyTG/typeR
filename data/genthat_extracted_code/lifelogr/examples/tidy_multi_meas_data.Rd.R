library(lifelogr)


### Name: tidy_multi_meas_data
### Title: Tidy daily data.
### Aliases: tidy_multi_meas_data

### ** Examples

a <- tibble::tibble(date = 
         lubridate::ymd("1970-01-01", "1970-01-02", "1970-01-03"), 
         sleepDurationHrs = c(7.5, 8.0, 7.9), 
         minAsleepHrs = c(7.4, 7.0, 7.7))
tidy_multi_meas_data(a)



