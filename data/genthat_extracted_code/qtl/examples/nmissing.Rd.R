library(qtl)


### Name: nmissing
### Title: Number of missing genotypes
### Aliases: nmissing
### Keywords: utilities

### ** Examples

data(listeria)

# plot number of missing genotypes for each individual
plot(nmissing(listeria))

# plot number of missing genotypes for each marker
plot(nmissing(listeria, what="mar"))



