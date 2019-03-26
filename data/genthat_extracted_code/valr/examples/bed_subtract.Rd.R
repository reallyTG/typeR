library(valr)


### Name: bed_subtract
### Title: Subtract two sets of intervals.
### Aliases: bed_subtract

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 1,      100
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 50,     75
)

bed_glyph(bed_subtract(x, y))

x <- trbl_interval(
 ~chrom, ~start, ~end,
 'chr1', 100,    200,
 'chr1', 250,    400,
 'chr1', 500,    600,
 'chr1', 1000,   1200,
 'chr1', 1300,   1500
)

y <- trbl_interval(
 ~chrom, ~start, ~end,
 'chr1', 150,    175,
 'chr1', 510,    525,
 'chr1', 550,    575,
 'chr1', 900,    1050,
 'chr1', 1150,   1250,
 'chr1', 1299,   1501
)

bed_subtract(x, y)

bed_subtract(x, y, any = TRUE)




