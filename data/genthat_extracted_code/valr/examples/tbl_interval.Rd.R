library(valr)


### Name: tbl_interval
### Title: Tibble for intervals.
### Aliases: tbl_interval trbl_interval

### ** Examples

x <- tibble::tribble(
  ~chrom, ~start, ~end,
  'chr1',  1,     50,
  'chr1',  10,    75,
  'chr1',  100,   120
)

is.tbl_interval(x)

x <- tbl_interval(x)
is.tbl_interval(x)




