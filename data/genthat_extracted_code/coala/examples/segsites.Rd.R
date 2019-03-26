library(coala)


### Name: create_segsites
### Title: Segregating Sites
### Aliases: create_segsites get_snps get_positions set_positions
###   get_trio_locus set_trio_locus segsites is_segsites create_locus_trio

### ** Examples

snps <- matrix(c(1, 0, 0,
                 1, 1, 0,
                 0, 0, 1), 3, 3, TRUE)
pos <- c(.1, .3, .5)
segsites <- create_segsites(snps, pos)
print(segsites)
get_snps(segsites)
get_positions(segsites)

# When subsetting individuals, sites that are not
# segregating in these are automatically removed:
segsites[1:2, 1:3]



