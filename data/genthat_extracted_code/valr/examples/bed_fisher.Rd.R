library(valr)


### Name: bed_fisher
### Title: Fisher's test to measure overlap between two sets of intervals.
### Aliases: bed_fisher

### ** Examples

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

x <- bed_random(genome, seed = 1010486)
y <- bed_random(genome, seed = 9203911)

bed_fisher(x, y, genome)




