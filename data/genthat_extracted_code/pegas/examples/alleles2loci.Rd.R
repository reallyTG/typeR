library(pegas)


### Name: alleles2loci
### Title: Build Loci Object From Matrix of Alleles
### Aliases: alleles2loci
### Keywords: IO

### ** Examples

x <- matrix(c("A", "A", "A", "a"), 2)
colnames(x) <- c("Loc1", NA)
y <- alleles2loci(x)
print(y, details = TRUE)



