library(polysat)


### Name: find.missing.gen
### Title: Find Missing Genotypes
### Aliases: find.missing.gen
### Keywords: manip

### ** Examples

# set up the genotype data
samples <- paste("ind", 1:4, sep="")
samples
loci <- paste("loc", 1:3, sep="")
loci
testgen <- new("genambig", samples = samples, loci = loci)
Genotypes(testgen, loci="loc1") <- list(c(-9), c(102,104),
                                        c(100,106,108,110,114),
                                        c(102,104,106,110,112))
Genotypes(testgen, loci="loc2") <- list(c(77,79,83), c(79,85), c(-9),
                                        c(83,85,87,91))
Genotypes(testgen, loci="loc3") <- list(c(122,128), c(124,126,128,132),
                                        c(120,126), c(124,128,130))

# look up which samples*loci have missing genotypes
find.missing.gen(testgen)




