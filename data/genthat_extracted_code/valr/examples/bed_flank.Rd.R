library(valr)


### Name: bed_flank
### Title: Create flanking intervals from input intervals.
### Aliases: bed_flank

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1',      25,      50,
  'chr1',      100,     125
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 130
)

bed_glyph(bed_flank(x, genome, both = 20))

x <- trbl_interval(
 ~chrom, ~start, ~end, ~name, ~score, ~strand,
 'chr1', 500,    1000, '.',   '.',    '+',
 'chr1', 1000,   1500, '.',   '.',    '-'
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 5000
)

bed_flank(x, genome, left = 100)

bed_flank(x, genome, right = 100)

bed_flank(x, genome, both = 100)

bed_flank(x, genome, both = 0.5, fraction = TRUE)




