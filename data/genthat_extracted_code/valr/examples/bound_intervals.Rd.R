library(valr)


### Name: bound_intervals
### Title: Select intervals bounded by a genome.
### Aliases: bound_intervals

### ** Examples

x <- trbl_interval(
 ~chrom, ~start, ~end,
 "chr1", -100,   500,
 "chr1", 100,    1e9,
 "chr1", 500,    1000
)

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

# out-of-bounds are removed by default ...
bound_intervals(x, genome)

# ... or can be trimmed within the bounds of a genome
bound_intervals(x, genome, trim = TRUE)




