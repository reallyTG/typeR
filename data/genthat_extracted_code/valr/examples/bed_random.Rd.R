library(valr)


### Name: bed_random
### Title: Generate randomly placed intervals on a genome.
### Aliases: bed_random

### ** Examples

genome <- trbl_genome(
  ~chrom,  ~size,
  "chr1",  10000000,
  "chr2",  50000000,
  "chr3",  60000000,
  "chrX",  5000000
)

bed_random(genome, seed = 10104)

# sorting can be suppressed
bed_random(genome, sort_by = NULL, seed = 10104)

# 500 random intervals of length 500
bed_random(genome, length = 500, n = 500, seed = 10104)




