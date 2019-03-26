library(valr)


### Name: bed_projection
### Title: Projection test for query interval overlap.
### Aliases: bed_projection

### ** Examples

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

x <- bed_random(genome, seed = 1010486)
y <- bed_random(genome, seed = 9203911)

bed_projection(x, y, genome)

bed_projection(x, y, genome, by_chrom = TRUE)




