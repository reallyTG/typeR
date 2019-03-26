library(tsibble)


### Name: as_tsibble
### Title: Coerce to a tsibble object
### Aliases: as_tsibble as_tsibble.tbl_df as_tsibble.tbl_ts
###   as_tsibble.data.frame as_tsibble.list as_tsibble.ts as_tsibble.mts
###   as_tsibble.hts

### ** Examples

# coerce tibble to tsibble w/o a key ----
tbl1 <- tibble(
  date = as.Date("2017-01-01") + 0:9,
  value = rnorm(10)
)
as_tsibble(tbl1)
# specify the index var
as_tsibble(tbl1, index = date)

# coerce tibble to tsibble with one key ----
# "date" is automatically considered as the index var, and "group" is the key
tbl2 <- tibble(
  mth = rep(yearmonth("2017-01") + 0:9, 3),
  group = rep(c("x", "y", "z"), each = 10),
  value = rnorm(30)
)
as_tsibble(tbl2, key = id(group))
as_tsibble(tbl2, key = id(group), index = mth)

# coerce ts to tsibble
as_tsibble(AirPassengers)
as_tsibble(sunspot.year)
as_tsibble(sunspot.month)
as_tsibble(austres)

# coerce mts to tsibble
z <- ts(matrix(rnorm(300), 100, 3), start = c(1961, 1), frequency = 12)
as_tsibble(z)
as_tsibble(z, gather = FALSE)




