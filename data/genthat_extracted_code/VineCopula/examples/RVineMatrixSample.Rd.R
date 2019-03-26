library(VineCopula)


### Name: RVineMatrixSample
### Title: Random sampling of R-Vine matrices
### Aliases: RVineMatrixSample

### ** Examples

# Matrix and sample sizes
d <- 10
size <- 5

# Sample R-vine matrices
RVM <- RVineMatrixSample(d, size)
sapply(RVM, RVineMatrixCheck)

# Sample R-vine matrices in the natural order
RVM <- RVineMatrixSample(d, size, naturalOrder = TRUE)
sapply(RVM, RVineMatrixCheck)




