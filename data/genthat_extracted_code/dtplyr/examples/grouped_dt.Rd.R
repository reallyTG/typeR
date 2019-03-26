library(dtplyr)


### Name: grouped_dt
### Title: A grouped data table.
### Aliases: grouped_dt is.grouped_dt

### ** Examples

library(dplyr, warn.conflicts = FALSE)
if (require("nycflights13")) {
flights_dt <- tbl_dt(flights)
group_size(group_by(flights_dt, year, month, day))
group_size(group_by(flights_dt, dest))

monthly <- group_by(flights_dt, month)
summarise(monthly, n = n(), delay = mean(arr_delay))
}



