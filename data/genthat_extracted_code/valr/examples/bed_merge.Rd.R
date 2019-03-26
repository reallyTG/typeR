library(valr)


### Name: bed_merge
### Title: Merge overlapping intervals.
### Aliases: bed_merge

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1',  1,      50,
  'chr1',  10,     75,
  'chr1',  100,    120
)

bed_glyph(bed_merge(x))

x <- trbl_interval(
 ~chrom, ~start, ~end, ~value, ~strand,
 "chr1", 1,      50,   1,      '+',
 "chr1", 100,    200,  2,      '+',
 "chr1", 150,    250,  3,      '-',
 "chr2", 1,      25,   4,      '+',
 "chr2", 200,    400,  5,      '-',
 "chr2", 400,    500,  6,      '+',
 "chr2", 450,    550,  7,      '+'
)

bed_merge(x)

bed_merge(x, max_dist = 100)

# merge intervals on same strand
bed_merge(dplyr::group_by(x, strand))

bed_merge(x, .value = sum(value))




