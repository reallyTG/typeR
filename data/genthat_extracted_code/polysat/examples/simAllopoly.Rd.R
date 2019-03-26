library(polysat)


### Name: simAllopoly
### Title: Generate Simulated Datasets
### Aliases: simAllopoly
### Keywords: datagen

### ** Examples

# Generate an allotetraploid dataset with no homoplasy.
# One isolocus has five alleles, while the other has eight.
test <- simAllopoly(n.alleles=c(5,8))

# Generate an allo-octoploid dataset with two tetraploid subgenomes, ten
# alleles per subgenome, including one homoplasious allele.
test2 <- simAllopoly(ploidy=c(4,4), n.alleles=c(10,10), n.homoplasy=1)

# Generate an allotetraploid dataset, and manually define allele names
# and frequencies.
test3 <- simAllopoly(alleles=list(c(120,124,126),c(130,134,138,140)),
                         freq=list(c(0.4,0.3,0.3),c(0.25,0.25,0.25,0.25)))

# Generate an autotetraploid dataset with seven alleles
test4 <- simAllopoly(ploidy=4, n.alleles=7)

# Generate an allotetraploid dataset with a null allele at high frequency
test5 <- simAllopoly(n.null.alleles=c(1,0),
                      freq=list(c(0.5,0.1,0.1,0.3), c(0.25,0.25,0.4,0.1)))



