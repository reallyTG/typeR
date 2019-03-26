library(valr)


### Name: bed_cluster
### Title: Cluster neighboring intervals.
### Aliases: bed_cluster

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 100,    200,
  'chr1', 180,    250,
  'chr1', 250,    500,
  'chr1', 501,    1000,
  'chr2', 1,      100,
  'chr2', 150,    200
)

bed_cluster(x)

# glyph illustrating clustering of overlapping and book-ended intervals
x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 1,      10,
  'chr1', 5,      20,
  'chr1', 30,     40,
  'chr1', 40,     50,
  'chr1', 80,     90
)

bed_glyph(bed_cluster(x), label = '.id')




