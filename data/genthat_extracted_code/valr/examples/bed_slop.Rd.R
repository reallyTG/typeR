library(valr)


### Name: bed_slop
### Title: Increase the size of input intervals.
### Aliases: bed_slop

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 110,    120,
  'chr1', 225,    235
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 400
)

bed_glyph(bed_slop(x, genome, both = 20, trim = TRUE))

genome <- trbl_genome(
 ~chrom, ~size,
 "chr1", 5000
)

x <- trbl_interval(
 ~chrom, ~start, ~end, ~name, ~score, ~strand,
 "chr1", 500,    1000, '.',   '.',     '+',
 "chr1", 1000,   1500, '.',   '.',     '-'
)

bed_slop(x, genome, left = 100)

bed_slop(x, genome, right = 100)

bed_slop(x, genome, both = 100)

bed_slop(x, genome, both = 0.5, fraction = TRUE)




