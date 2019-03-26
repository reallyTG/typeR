library(valr)


### Name: tbl_genome
### Title: Tibble for reference sizes.
### Aliases: tbl_genome trbl_genome

### ** Examples

genome <- tibble::tribble(
  ~chrom, ~size,
  'chr1', 1e6,
  'chr2', 1e7
)

is.tbl_genome(genome)
genome <- tbl_genome(genome)
is.tbl_genome(genome)

trbl_genome(
  ~chrom, ~size,
  'chr1', 1e6
)




