library(rebus.datetimes)


### Name: IsoClasses
### Title: ISO 8601 date-time classes
### Aliases: IsoClasses IsoDateTime iso_date iso_datetime iso_time

### ** Examples

iso_date()
iso_time()
iso_datetime()

# With repetition
iso_date(3, 6)
iso_time(1, Inf)
iso_datetime(0, Inf)

# Without a class wrapper
iso_date(char_class = FALSE)



