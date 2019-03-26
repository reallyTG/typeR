library(valr)


### Name: bed_shuffle
### Title: Shuffle input intervals.
### Aliases: bed_shuffle

### ** Examples

genome <- trbl_genome(
 ~chrom, ~size,
 "chr1", 1e6,
 "chr2", 2e6,
 "chr3", 4e6
)

x <- bed_random(genome, seed = 1010486)

bed_shuffle(x, genome, seed = 9830491)




