library(valr)


### Name: bed_closest
### Title: Identify closest intervals.
### Aliases: bed_closest

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 100,    125
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 25,     50,
  'chr1', 140,    175
)

bed_glyph(bed_closest(x, y))

x <- trbl_interval(
  ~chrom, ~start, ~end,
  "chr1", 500,    600,
  "chr2", 5000,   6000
)

y <- trbl_interval(
  ~chrom, ~start, ~end,
  "chr1", 100,    200,
  "chr1", 150,    200,
  "chr1", 550,    580,
  "chr2", 7000,   8500
)

bed_closest(x, y)

bed_closest(x, y, overlap = FALSE)

# Report distance based on strand
x <- trbl_interval(
  ~chrom, ~start, ~end, ~name, ~score, ~strand,
  "chr1", 10,	   20,   "a",   1,      "-"
)

y <- trbl_interval(
  ~chrom, ~start, ~end, ~name, ~score, ~strand,
  "chr1", 8,	     9,	   "b",   1,      "+",
  "chr1", 21,	   22,	 "b",   1,      "-"
)

res <- bed_closest(x, y)

# convert distance based on strand
res$.dist_strand <- ifelse(res$strand.x == "+", res$.dist, -(res$.dist))
res

# report absolute distances
res$.abs_dist <- abs(res$.dist)
res




