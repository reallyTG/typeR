library(valr)


### Name: bed_reldist
### Title: Compute relative distances between intervals.
### Aliases: bed_reldist

### ** Examples

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

x <- bed_random(genome, seed = 1010486)
y <- bed_random(genome, seed = 9203911)

bed_reldist(x, y)

bed_reldist(x, y, detail = TRUE)




