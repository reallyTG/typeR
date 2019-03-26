library(haplo.stats)


### Name: geno1to2
### Title: convert genotype matrix from 1-column 2-column
### Aliases: geno1to2
### Keywords: utilities

### ** Examples

geno1 <- matrix(c(0,0,1,
                  1,0,2,
                  2,1,0), ncol=3, byrow=TRUE)
geno1to2(geno1, locus.label=c("A", "B", "C"))

## demonstrate how NA and 3 will be coded
geno1[1,3] <- NA
geno1[1,1] <- 3
geno1to2(geno1)



