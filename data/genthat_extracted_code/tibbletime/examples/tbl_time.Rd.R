library(tibbletime)


### Name: as_tbl_time
### Title: Create 'tbl_time' objects
### Aliases: as_tbl_time tbl_time

### ** Examples


# Converting a data.frame to a `tbl_time`
# Using Date index
ex1 <- data.frame(date = Sys.Date(), value = 1)
ex1_tbl_time <- as_tbl_time(ex1, date)
class(ex1_tbl_time)
attributes(ex1_tbl_time)

# Converting a tibble to a `tbl_time`
# Using POSIXct index
ex2 <- tibble::tibble(
  time  = as.POSIXct(c("2017-01-01 10:12:01", "2017-01-02 12:12:01")),
  value = c(1, 2)
)
as_tbl_time(ex2, time)




