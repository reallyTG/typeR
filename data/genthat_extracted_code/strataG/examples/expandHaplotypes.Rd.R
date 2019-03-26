library(strataG)


### Name: expandHaplotypes
### Title: Expand haplotypes
### Aliases: expandHaplotypes

### ** Examples

data(dloop.g)

# Haplotypes have already been labelled
dloop.g

# Haplotypes expanded to individual sequences (num.alleles == num.samples)
expanded.g <- expandHaplotypes(dloop.g)
expanded.g




