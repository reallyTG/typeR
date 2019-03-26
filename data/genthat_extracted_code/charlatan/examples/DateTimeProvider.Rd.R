library(charlatan)


### Name: DateTimeProvider
### Title: DateTimeProvider
### Aliases: DateTimeProvider
### Keywords: internal

### ** Examples

z <- DateTimeProvider$new()
z$countries
z$centuries
z$century()
z$timezone()
z$unix_time()
z$date("%Y-%M-%d")
z$date_time()
z$year()

# date time between a range of dates
(start_date <- Sys.time() - 604800L)
z$date_time_between(start_date = start_date)
# in the year 1900
z$date_time_between("1900-01-01 00:00:00 PST", "1900-12-31 00:00:00 PST")
z$date_time_between("1900-01-01", "1900-12-31")



