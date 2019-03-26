library(gaston)


### Name: reshape.GRM
### Title: Reshape a Genetic Relationship Matrix
### Aliases: reshape.GRM
### Keywords: Genetic Relationship Matrix

### ** Examples

# load chr2 data set (~10k SNPs in low LD)
x <- read.bed.matrix( system.file("extdata", "chr2.bed", package="gaston") )

# Compute Genetic Relationship Matrix
K <- GRM(x)

# List all pairs if individuals with a relationship above 0.07
pairs <- reshape.GRM(K, exclude = c(-Inf, 0.07))

# Exclude first individual from each such pair
x1 <- x[ -pairs$i, ]



