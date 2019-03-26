library(rccdates)


### Name: as.Dates
### Title: Converting all potential dates in a data.frame
### Aliases: as.Dates as.Dates.data.frame as.Dates.default

### ** Examples


# Let's say we have a data.frame with one date column and one column that is almost
# (but not excactly) a date:
test_data <- data.frame(
                 not_date = c("19121212", "1912-12-12", "2014-01-01", "121212"),
                 date     = c(19121212, "1912-12-12", "2014-01-01", "6405"))
as.Dates(test_data) # Only recognizes the "date" column as date

# Inform that the "not_date" column might also be a date candidate if fixed:
as.Dates(test_data, threshold = .5)

# Force the not_date column to date
as.Dates(test_data, threshold = .5, force = TRUE)



