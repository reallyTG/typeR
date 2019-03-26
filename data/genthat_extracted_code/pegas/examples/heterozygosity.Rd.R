library(pegas)


### Name: heterozygosity
### Title: Heterozygosity at a Locus Using Gene Frequencies
### Aliases: heterozygosity H
### Keywords: manip univar

### ** Examples

data(jaguar)
## convert the data and compute frequencies:
S <- summary(jaguar)
## compute H for all loci:
sapply(S, function(x) H(x$allele))
## ... and its variance
sapply(S, function(x) H(x$allele, variance = TRUE))



