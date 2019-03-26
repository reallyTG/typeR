library(valr)


### Name: bed_glyph
### Title: Create example glyphs for valr functions.
### Aliases: bed_glyph

### ** Examples

x <- trbl_interval(
 ~chrom, ~start, ~end,
 'chr1', 25,     50,
 'chr1', 100,    125
)

y <- trbl_interval(
  ~chrom, ~start, ~end, ~value,
  'chr1', 30,     75,  50
)

bed_glyph(bed_intersect(x, y))

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 30,     75,
  'chr1', 50,     90,
  'chr1', 91,     120
)

bed_glyph(bed_merge(x))

bed_glyph(bed_cluster(x), label = '.id')




