library(valr)


### Name: interval_spacing
### Title: Calculate interval spacing.
### Aliases: interval_spacing

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 1,      100,
  'chr1', 150,    200,
  'chr2', 200,    300
)

interval_spacing(x)




