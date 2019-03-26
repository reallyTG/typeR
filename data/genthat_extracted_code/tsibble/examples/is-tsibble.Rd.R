library(tsibble)


### Name: is_tsibble
### Title: If the object is a tsibble
### Aliases: is_tsibble is.tsibble is_grouped_ts is.grouped_ts

### ** Examples

# A tibble is not a tsibble ----
tbl <- tibble(
  date = seq(as.Date("2017-10-01"), as.Date("2017-10-31"), by = 1),
  value = rnorm(31)
)
is_tsibble(tbl)

# A tsibble ----
tsbl <- as_tsibble(tbl, index = date)
is_tsibble(tsbl)



