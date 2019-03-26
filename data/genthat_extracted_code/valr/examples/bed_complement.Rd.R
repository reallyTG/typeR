library(valr)


### Name: bed_complement
### Title: Identify intervals in a genome not covered by a query.
### Aliases: bed_complement

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
  'chr1', 0,      10,
  'chr1', 75,     100
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 200
)

bed_glyph(bed_complement(x, genome))

genome <- trbl_genome(
   ~chrom,  ~size,
   'chr1',  500,
   'chr2',  600,
   'chr3',  800
)

x <- trbl_interval(
   ~chrom, ~start, ~end,
   'chr1', 100,    300,
   'chr1', 200,    400,
   'chr2', 0,      100,
   'chr2', 200,    400,
   'chr3', 500,    600
)

# intervals not covered by x
bed_complement(x, genome)




