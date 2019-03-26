library(valr)


### Name: bed_intersect
### Title: Identify intersecting intervals.
### Aliases: bed_intersect

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 25,      50,
  'chr1', 100,     125
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 30,     75
)

bed_glyph(bed_intersect(x, y))

bed_glyph(bed_intersect(x, y, invert = TRUE))

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 100,    500,
  'chr2', 200,    400,
  'chr2', 300,    500,
  'chr2', 800,    900
)

y <- trbl_interval(
  ~chrom, ~start, ~end, ~value,
  'chr1', 150,    400,  100,
  'chr1', 500,    550,  100,
  'chr2', 230,    430,  200,
  'chr2', 350,    430,  300
)

bed_intersect(x, y)

bed_intersect(x, y, invert = TRUE)

# start and end of each overlapping interval
res <- bed_intersect(x, y)
dplyr::mutate(res, start = pmax(start.x, start.y),
                   end = pmin(end.x, end.y))

z <- trbl_interval(
  ~chrom, ~start, ~end, ~value,
  'chr1', 150,    400,  100,
  'chr1', 500,    550,  100,
  'chr2', 230,    430,  200,
  'chr2', 750,    900,  400
)

bed_intersect(x, y, z)

bed_intersect(x, exons = y, introns = z)

# a list of tbl_intervals can also be passed
bed_intersect(x, list(exons = y, introns = z))




