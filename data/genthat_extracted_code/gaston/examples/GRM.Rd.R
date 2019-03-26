library(gaston)


### Name: GRM
### Title: Genetic Relationship Matrix
### Aliases: GRM
### Keywords: Genetic Relationship Matrix

### ** Examples

# load chr2 data set (~10k SNPs in low LD)
x <- read.bed.matrix( system.file("extdata", "chr2.bed", package="gaston") )

# Compute Genetic Relationship Matrix
K <- GRM(x)
dim(K)



