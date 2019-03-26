library(valr)


### Name: bed_shift
### Title: Adjust intervals by a fixed size.
### Aliases: bed_shift

### ** Examples

x <- trbl_interval(
  ~chrom, ~start, ~end,
 'chr1',  25,     50,
 'chr1',  100,    125
)

genome <- trbl_genome(
  ~chrom, ~size,
  'chr1', 125
)

bed_glyph(bed_shift(x, genome, size = -20))

x <- trbl_interval(
   ~chrom, ~start, ~end, ~strand,
   "chr1", 100,    150,  "+",
   "chr1", 200,    250,  "+",
   "chr2", 300,    350,  "+",
   "chr2", 400,    450,  "-",
   "chr3", 500,    550,  "-",
   "chr3", 600,    650,  "-"
)

genome <- trbl_genome(
   ~chrom, ~size,
   "chr1", 1000,
   "chr2", 2000,
   "chr3", 3000
)

bed_shift(x, genome, 100)

bed_shift(x, genome, fraction = 0.5)

# shift with respect to strand
stranded <- dplyr::group_by(x, strand)
bed_shift(stranded, genome, 100)




