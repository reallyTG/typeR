library(polysat)


### Name: viewGenotypes
### Title: Print Genotypes to the Console
### Aliases: viewGenotypes
### Keywords: print

### ** Examples

# create a dataset for this example
mygen <- new("genambig", samples=c("ind1", "ind2", "ind3", "ind4"),
             loci=c("locA", "locB"))
Genotypes(mygen) <- array(list(c(98, 104, 108), c(100, 104, 110, 114),
                               c(102, 108, 110), Missing(mygen),
                               c(132, 135), c(138, 141, 147),
                               c(135, 141, 144), c(129, 150)),
                          dim=c(4,2))

# view the genotypes
viewGenotypes(mygen)




