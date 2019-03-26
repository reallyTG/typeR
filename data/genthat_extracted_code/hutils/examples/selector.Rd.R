library(hutils)


### Name: selector
### Title: Fast selection of 'data.table' columns
### Aliases: selector

### ** Examples

RQ("nycflights13", no = {
 library(nycflights13)
 library(data.table)
 fs <- as.data.table(flights)
 fs1 <- selector(fs, year, month, day, arr_delay)
 fs1[, arr_delay := NA]
})



