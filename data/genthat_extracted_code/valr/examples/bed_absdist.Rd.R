library(valr)


### Name: bed_absdist
### Title: Compute absolute distances between intervals.
### Aliases: bed_absdist

### ** Examples

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

x <- bed_random(genome, seed = 1010486)
y <- bed_random(genome, seed = 9203911)

bed_absdist(x, y, genome)




