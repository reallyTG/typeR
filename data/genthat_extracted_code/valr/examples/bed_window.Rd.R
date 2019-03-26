library(valr)


### Name: bed_window
### Title: Identify intervals within a specified distance.
### Aliases: bed_window

### ** Examples

x <- trbl_interval(
 ~chrom, ~start, ~end,
 'chr1', 25,     50,
 'chr1', 100,    125
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 60,     75
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 125
)

bed_glyph(bed_window(x, y, genome, both = 15))

x <- trbl_interval(
  ~chrom, ~start, ~end,
  "chr1", 10,    100,
  "chr2", 200,    400,
  "chr2", 300,    500,
  "chr2", 800,    900
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  "chr1", 150,    400,
  "chr2", 230,    430,
  "chr2", 350,    430
)

genome <- trbl_genome(
  ~chrom, ~size,
  "chr1", 500,
  "chr2", 1000
)

bed_window(x, y, genome, both = 100)




