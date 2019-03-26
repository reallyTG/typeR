library(gaston)


### Name: DM
### Title: Dominance Matrix
### Aliases: DM
### Keywords: Dominance Matrix

### ** Examples

# load chr2 data set (~10k SNPs in low LD)
x <- read.bed.matrix( system.file("extdata", "chr2.bed", package="gaston") )

# Compute Dominance Matrix
D <- DM(x)
dim(D)




