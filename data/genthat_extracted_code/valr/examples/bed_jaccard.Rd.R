library(valr)


### Name: bed_jaccard
### Title: Calculate the Jaccard statistic for two sets of intervals.
### Aliases: bed_jaccard

### ** Examples

genome <- read_genome(valr_example('hg19.chrom.sizes.gz'))

x <- bed_random(genome, seed = 1010486)
y <- bed_random(genome, seed = 9203911)

bed_jaccard(x, y)

# calculate jaccard per chromosome
bed_jaccard(dplyr::group_by(x, chrom),
            dplyr::group_by(y, chrom))




